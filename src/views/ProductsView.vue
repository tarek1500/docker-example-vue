<template>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Description</th>
				<th>Created at</th>
				<th>Updated at</th>
			</tr>
		</thead>
		<tbody>
			<tr v-for="product of products" :key="product.id">
				<td>{{ product.id }}</td>
				<td>{{ product.name }}</td>
				<td>{{ product.description }}</td>
				<td>{{ new Date(product.created_at).toISOString() }}</td>
				<td>{{ new Date(product.updated_at).toISOString() }}</td>
			</tr>
		</tbody>
	</table>
</template>

<script setup lang="ts">
	import { ref } from 'vue';
	import Data from '../types/Data';
	import Product from '../types/Product';

	let products = ref<Product[]>([]);

	fetch('http://localhost:8000/api/products')
		.then(response => response.json() as Promise<Data<Product>>)
		.then(data => products.value = data.data)
		.catch(error => console.log(error));
</script>

<style>
	table {
		margin: auto;
	}

	table,
	th,
	td {
		border: 1px solid black;
	}
</style>
