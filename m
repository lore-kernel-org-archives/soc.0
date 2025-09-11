Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E888322A3B
	for <soc@lists.linux.dev>; Thu, 11 Sep 2025 14:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757599995; cv=fail; b=NCmrYr7hJLhsD+O6j/Wa5Rwe0mvGCPGtcl6dUIh8r1B4I+1i+ii52r+WW2BpLxjfqGsZ0Z3cegp+L8NlVELfLQkxBX3auXxhLeAdRMUpsB/PW8h81EWWS2zRkLv2uzLxbQOLDRdhVOXkaeKJGOBx2nZseD52scBp0PwnFhnF2EQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757599995; c=relaxed/simple;
	bh=MQqDu+dnYX/To/C8ZKbVxVc8Wptav9RWfrOWnsdTmuc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ua88Vu87F0czk78qnuPtIHww0wJbxm7gB7TPNDuENXUbXq41Oz9cimGEx59I+J/Ihoe9iMsA0JqKHBptqt42yqvgluxQUXOO+r05dsNJusCV64N8RenUB9gfyyChYwQt2c27yvUzQ5FvOITrhc8CL1XmVavE4iT+gCmfHuNoq8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=ujP50hDw; arc=fail smtp.client-ip=40.107.244.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="ujP50hDw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4hwyS+Pcg6y5nxH1QD6WCA10YvwA8EnrfbD6tKPy0KjFcxp2Bv9/ZesVZwfVGerea/u0ZvCksaaj0B/QLmUFikJKeOi0oyZqZxE2887OzmDedl2Smd1vIYaNbo9OYo0hdqtMAlCcTcwfkbIDKVvEsToJb+YSdUlBvZyJJCmWc8lxjhJEqMOJ/aoakaIqY35U2qQQg+wBE5oSjynmmxjAH1HeVL7JoG8lp6HVIFjYPIQOjegsO79jrwVw4hY6ymczANclGFFsuhP5tQxWqInH5XHymOxNELXMuZB6ugR1YplCzmwgvvXIbXiKwhppu28NtjfBBEmZun9UB81JGj7Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfqBG8jt9pf/IT7CiOWh3CszNExffqKRzT7c04FNi0w=;
 b=MF9AOflFzJ3MWa7eBDFbYVhodt2GPcxlFKpFhSv1OjWMUJ89f+aYfj9E1OEKBWJ1kJ/0Pkec7vo3WzZ452UFF95yy8cCcb4IXYKfB+DZxyJaw5HJSbG8d5Y9Gvr16b2q9cvNue+jnHpZszRG0ekG9ZgJ76ZAwLX/rlLJkJMf8thDrNDa3bOPTyZKPXiExztUTV0J3ssVug+96I9S5TVTtD/M1rmPdr/DYU7DlOJz6C4uV/oNXzpvfiy+OzYHqoUdeyNTYfkv6NUjlGiRhbgUg7e81jZ9ms42N07Cr3iFOm7dUyjNnTDI4blVkX1UkU/MVhEkcnfghVtygsDR19cALw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfqBG8jt9pf/IT7CiOWh3CszNExffqKRzT7c04FNi0w=;
 b=ujP50hDwh6vMpDvII/X8vGdr56N+ia81rwbgLuo3rweTmPhJd2nk5f01LQdGfF1HYqGU+snH0FGR4rR7jWKxdAjWQNbIPtWab+Ln4Mx68pVSJeh3qXcMaFaZymnVCOK8cM9CjpycISmA0sYJoEQgftGyTBI1at8Ljysi5M8UomA=
Received: from SA3PR04MB8931.namprd04.prod.outlook.com (2603:10b6:806:381::22)
 by PH0PR04MB7621.namprd04.prod.outlook.com (2603:10b6:510:55::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 14:13:10 +0000
Received: from SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d]) by SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 14:13:10 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Arnd Bergmann <arnd@arndb.de>, "soc@lists.linux.dev"
	<soc@lists.linux.dev>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: Samuel Holland <samuel.holland@sifive.com>, Darshan Prajapati
	<darshan.prajapati@einfochips.com>, Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: RE: [PATCH v5 0/6] Basic device tree support for ESWIN EIC7700 RISC-V
 SoC
Thread-Topic: [PATCH v5 0/6] Basic device tree support for ESWIN EIC7700
 RISC-V SoC
Thread-Index: AQHcFcOYvoOQK5H600Kr75jMeYoVabRzXDYggBrDuHA=
Date: Thu, 11 Sep 2025 14:13:09 +0000
Message-ID:
 <SA3PR04MB8931FADEA6BE8B7203BE28AA8309A@SA3PR04MB8931.namprd04.prod.outlook.com>
References: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
 <SA3PR04MB89314EC1A67A05831EABDF8C833EA@SA3PR04MB8931.namprd04.prod.outlook.com>
In-Reply-To:
 <SA3PR04MB89314EC1A67A05831EABDF8C833EA@SA3PR04MB8931.namprd04.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=12e61810-7be8-4d7e-91f3-c6e94f398cd8;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2025-08-25T13:26:31Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR04MB8931:EE_|PH0PR04MB7621:EE_
x-ms-office365-filtering-correlation-id: 3a4a2018-59df-4992-09aa-08ddf13d564b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?T6hCVP6KMaA9yhLBcqVUMsiJfdfoVgvcG1g0hsXfPgx1Vg1dL7zzgZ5+vfeA?=
 =?us-ascii?Q?c9LzZxY8mOxP+su/XVJkGvM+AIho3Lyfb84Jk5vGg7x8pE7nItqYxggY+CxA?=
 =?us-ascii?Q?xks1i1u+u399DHpmJZZuH/YTz13vGpH4QPLXp/hIRoHaA7LMp3+2LrQYugPK?=
 =?us-ascii?Q?9HxxhQ67T1WPtGDRGIFPxxpG23bBwQummfzrVjaZ+VLZ6f91IYxieY9xJG7A?=
 =?us-ascii?Q?iohp8D3lSUmZLZnpb0I0M5af54r3o24OKLUalQJDDgw+JRO12kPSE0Eu7hR0?=
 =?us-ascii?Q?2IMCUTcdihWpzfSpd+EayKj+gr/YJFPZsDyQxtuz3TxrDl0nLrtTbbuvtkGR?=
 =?us-ascii?Q?Ig6r14kxaLUX9pjmGdRuC9wWj2cvn4yN6OJGas6+TUOU5SZLzb2RwVHcmZtz?=
 =?us-ascii?Q?kOkGhKM0JaWeKGMf2UFoEqBT1cAyqCX7CSVGWb2XXhm2Xq+z6BxkAXxoCtnG?=
 =?us-ascii?Q?JxLv6hPvVr8CFhXHbfsza7BxPEAXT5rjfc7K57frFNxB/058FuPlibxJ4ttU?=
 =?us-ascii?Q?dbUbtBovm1qziwd9AX8rSw4+NITEAWu1glOvmDnrZkjj7skmdnrh0ILk5YVz?=
 =?us-ascii?Q?vxQuJqDLfsD2W1gyWAHMz7HnQXQbTd6hcHY1J78DmF5wKhVPTfV9QEr7NAtE?=
 =?us-ascii?Q?TbYzGGNu5jANberH+Zg2Nz9mL3gx6NB5L1I92XsC8H6fL/dB5FaaULdQDYTo?=
 =?us-ascii?Q?pHsLlhAa2CktNEfNkIvOhiegcZ4GbyIw79ZuwoaJ8epSUzHWpaO9x3hZoYvV?=
 =?us-ascii?Q?Idz/MyX8TGl5TaZgjPxwuhVKTuNrLhpXUw/8B2Tc5XgsyOnAM6rqBZt7qyTS?=
 =?us-ascii?Q?9IGqx7aVMJBrlwMhszCqfIBEZO7WgekW943gCGWHC8znLkwMwUZzVKTStvEd?=
 =?us-ascii?Q?9TLpyZWQe70LVbU6xABdqoVCOaHUQGeIaF9iOo2pWRL/t5zO74FzZcvdzl3r?=
 =?us-ascii?Q?01vegXyrGp1ZHvEwkOEEGAITqACAtmP7EtOK0+nNPn75bX0S0ORrKsheuZym?=
 =?us-ascii?Q?/nFCKD8YK1VfqrPiGH6OLWv1rQ34ltoGRZnwEU/UiU1yhN26fmsXSYvKKoNn?=
 =?us-ascii?Q?4eVH/Gjm7g7QScD2dzhZZa0bqjKunTgPwSbbwA9wdNxsO6f4lKiVluOmRYOZ?=
 =?us-ascii?Q?CsGcGDL7CsqoKVRk1Rn1Qid60weCVzabvPL7cIXp67BYPUP/k7mIWt3n05kv?=
 =?us-ascii?Q?TiOfsuvFy/h8d3f09N8AvXeNu6EWcfwEL8OKQo86dEEvhLbiia5Q0rXWlZ3U?=
 =?us-ascii?Q?1DgeKSBHcVt+4jXfpvtCutZ+4D1cIzN+YIQLl4/iphx7GumVtt2VjOMxIJIW?=
 =?us-ascii?Q?s994ODs1ymCpCp7Qs+AIGJTRCME6TB0doBwx4B3xII1Wvsr1xymNI931wFh2?=
 =?us-ascii?Q?cH4i6tWZ7twf6R0ehLi9M6wF6Ber4bBXA9fU3fvkxHXtWxHfj0Ga7nHNsdbr?=
 =?us-ascii?Q?/BVvHrrLMsyNvPSCHmzPwF/Ti4Q+JWzJsA9KAJBiXkCIpW3XJ8xn2jJJbg4M?=
 =?us-ascii?Q?zJJSgqUsDuvTlEE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR04MB8931.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?P6FYi9K/WtIK8t+/HbxNh4Uy+VSjvmyxzW5KzxQpn6gkjjGhii44n2x8l4x5?=
 =?us-ascii?Q?7tRCP3VM4I86MNhLDyivizO4QdtqfwZTYJSDo7rEPiUQiE2lQby8TcNJnmP4?=
 =?us-ascii?Q?pXepvlPkFXS8Hrjph92DfrUA9nhnBSprAZuWuqqVnSsN/RQJTvYYv7utLfap?=
 =?us-ascii?Q?jhEG3sx06gZpX/eQmXsLWSIGq7hCDDx6hMjVx3cQConfbDxtbDwSFdojAo4G?=
 =?us-ascii?Q?bMnp52tEw70W91VpiSLjcvOjjNMDGyll5bHi5pExujnUGY6vAJugB6i4Jrtw?=
 =?us-ascii?Q?92FhhwLA6b9HMZGGa2BmdruhyCY2I/EzG3YEXslm2YObxK23CNkNgJgDwBQu?=
 =?us-ascii?Q?sHIzMRYRE9TmTlhcncylSjgpa89KvqUb5Jovx+/WGhZ/Vfe07RkBGaOy1GXM?=
 =?us-ascii?Q?zlsnmEw3sFGkWL1Uq1u7pge1yWlVKKOKKcDM+jSQJYqjZNw55Dpq0rX0rcNq?=
 =?us-ascii?Q?9yUtEkkN6MNd+xLMJbWXWxap3eruCJdQXtxGbFmsrra62qVjvwGw/JowN8GR?=
 =?us-ascii?Q?+D6SUhXY+/kBX/2aq9ssPU3HEeP7xEU6bxPkiHiJw+R6GeYlDcB2itZc4ODk?=
 =?us-ascii?Q?BlWCkTLxKf4wXtD+AJzxWXXg6c3z/5zXcPrlZXfDxmXZk5GQNre5njZ9OckO?=
 =?us-ascii?Q?DSeSO590axl5r1HJ6cV0xfNFql14crc89SWk/oNpChQZ1xR61WtkgmZeRfei?=
 =?us-ascii?Q?v2qS6WH5DBQeiKWgEQYf//gvdpMVHJg+M+2/fDTvte5m83ER/bmInM7QwZ1f?=
 =?us-ascii?Q?UOpd8zGKLYAKgA16sssEAaeXX0/BzHwRU6H4EFRpCGGPwOJeYvScBvhAniAG?=
 =?us-ascii?Q?bAypv8nGdkodQGFYG1cY4SDh52UE2Z9Tb/1Fm0qyqZtvmiH/LYnhD+hUYhoq?=
 =?us-ascii?Q?rndc3Yq+MM1TaOOV07i3pzS4Ilk81af/Qpcs6FV0OcN7mZfHMTJ3ahD53Un8?=
 =?us-ascii?Q?7bZ4OLjBPdMYV+yvVcPfLRo+Yo0MT4NZFHXSwN8qgGDMR6m776VHJE1uHkQS?=
 =?us-ascii?Q?QfgwmLywufPK10EBp5Uz+bwTAygJQ3YQ9IXa3gt8UxA1RiLXx+311nd2R6Uk?=
 =?us-ascii?Q?+gzTZHbO5GBnpeSG6iSHgMC56ls1tNLW1VSbUzZO79igoIebAPKJrX4X6LDX?=
 =?us-ascii?Q?yTlim6wrdZ5qIBUchaDT9EaaL+FGnC95pxd6V6BgNNgx4Z+fEk6waO8Vdi8E?=
 =?us-ascii?Q?Vsd6hqqk4mqCXTJJ/rJJsyk47ZGDF4m700viE31JZy0JD7TZEbkwhz1D8/zr?=
 =?us-ascii?Q?T6ADbXZKP/CJsOApGKJbpbTc7L6DmAJsPN6539w43rEGNZ85zNc5eU1cRsla?=
 =?us-ascii?Q?vwDlTR53twRgChnsojdkKb+T2GgeWsiReZli+aMrgskLy+7BtDAZwsn7gx3O?=
 =?us-ascii?Q?1VUPFFEsa4F9BuHcQp/RgYK545wPnICTCy3vug5z5lSdc//7Qbizwm1T0pXU?=
 =?us-ascii?Q?GkNyMlCpqc06+ot6lLIGpOy9AREaBwM3FDKaD1K9K5XCf+HcPuVQ3RtDyyYs?=
 =?us-ascii?Q?TBu8Zsev9t4bTiUY+jMh2qkEkYBNH4ftMDrwwO6RWG0hAZCK2HyJbxU+E3Qe?=
 =?us-ascii?Q?9P4TyIA/FQarMTfnHyUxs6fqQX0tJ8alX33e59vhDd0qvLeYJKNuiUPxcEDs?=
 =?us-ascii?Q?pQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR04MB8931.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4a2018-59df-4992-09aa-08ddf13d564b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 14:13:09.9094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3LBb2GYewaPHwIr9ZyXQKmW7OKuSnhfwEoCOuP8LuAcBQZ0jv1fNutC5yCT+NKu0i05R38EWv8kpN+rtjUACnaMa2UR4lD59XDU7adehF8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7621

Hello Arnd,

Gentle reminder. Please let me know if I need to follow any other steps.

Regards,
Pinkesh

On Mon, Aug 25, 2025 at 06:59 PM, Pinkesh Vaghela wrote:
> Hello Arnd,
>=20
> Can you please consider this patch series for RISC-V/Eswin EIC7700 SOC.
>=20
> Regards,
> Pinkesh
>=20
> On Mon, Aug 25, 2025 at 06:54 PM, Pinkesh Vaghela wrote:
> > Add support for ESWIN EIC7700 SoC consisting of SiFive Quad-Core
> > P550 CPU cluster and the first development board that uses it, the
> > SiFive HiFive Premier P550.
> >
> > This patch series adds initial device tree and also adds ESWIN
> > architecture support.
> >
> > Boot-tested using intiramfs with Linux v6.17-rc3 on HiFive Premier
> > P550 board using U-Boot 2024.01 and OpenSBI 1.4.
> >
> > Changes in v5:
> > - Rebased the patches to kernel v6.17-rc3
> > - Drop "dt-bindings: vendor-prefixes: add eswin" patch (Patch #3 in v4)
> >   as it is already applied by Rob Herring [1].
> > - Link to v4:
> > https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e
> > .k
> > ernel.org%2Flkml%2F20250616112316.3833343-1-
> >
> pinkesh.vaghela%40einfochips.com%2F&data=3D05%7C02%7Cpinkesh.vaghela%
> >
> 40einfochips.com%7Ca7a3db36d4f8414d95dd08dde3dab8ef%7C0beb0c359c
> >
> bb4feb99e5589e415c7944%7C1%7C0%7C638917250735611269%7CUnknown
> >
> %7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAi
> >
> OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> > eqrfYDxwbfOccXZ7im7%2BBS5ZWaLZZML0jfMac5yRRiA%3D&reserved=3D0
> >
> > [1]:
> > https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
.
> > ker
> > nel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-
> > next.git%2Fcommit%2F%3Fh%3Dnext-
> >
> 20250825%26id%3Dac29e4487aa20a21b7c3facbd1f14f5093835dc9&data=3D05
> >
> %7C02%7Cpinkesh.vaghela%40einfochips.com%7Ca7a3db36d4f8414d95dd08
> >
> dde3dab8ef%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C638917
> >
> 250735660956%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydW
> >
> UsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%
> >
> 3D%7C0%7C%7C%7C&sdata=3D5CsQwP5HjO0zRAL5CPMJvkpGom5W6FiBe%2B
> > GyzR1F1XU%3D&reserved=3D0
> >
> > Changes in v4:
> > - Rebased the patches to kernel v6.16-rc1
> > - Drop patches that are already merged
> > - Added "Acked-by" tag of "Min Lin" for Patch 4
> > - Corrected the commit message of Patch 7 (Patch #10 in v3)
> > - Added "Tested-by" tag of "Ariel D'Alessandro" for Patch 7
> > - Link to v3:
> > https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e
> > .k
> > ernel.org%2Flkml%2F20250410152519.1358964-1-
> >
> pinkesh.vaghela%40einfochips.com%2F&data=3D05%7C02%7Cpinkesh.vaghela%
> >
> 40einfochips.com%7Ca7a3db36d4f8414d95dd08dde3dab8ef%7C0beb0c359c
> >
> bb4feb99e5589e415c7944%7C1%7C0%7C638917250735680365%7CUnknown
> >
> %7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAi
> >
> OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> > FgYbanGvuw2gw1jpzSbG3KciYPXlasos0sPCVXf31fQ%3D&reserved=3D0
> >
> > Changes in v3:
> > - Rebased the patches to kernel 6.15.0-rc1
> > - Added "Reviewed-by" tag of "Rob Herring" for Patch 4
> > - Updated MAINTAINERS file
> >   - Add GIT tree URL
> > - Updated DTSI file
> >   - Added "dma-noncoherent" property to soc node
> >   - Updated GPIO node labels in DTSI file
> > - Link to v2:
> > https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e
> > .k
> > ernel.org%2Flkml%2F20250320105449.2094192-1-
> >
> pinkesh.vaghela%40einfochips.com%2F&data=3D05%7C02%7Cpinkesh.vaghela%
> >
> 40einfochips.com%7Ca7a3db36d4f8414d95dd08dde3dab8ef%7C0beb0c359c
> >
> bb4feb99e5589e415c7944%7C1%7C0%7C638917250735700104%7CUnknown
> >
> %7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAi
> >
> OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> >
> kvHq5Hf30zj9%2B%2BBQ6aoat0i7RL14roD8%2B2bCYJRKiR4%3D&reserved=3D0
> >
> > Changes in v2:
> > - Added "Acked-by" tag of "Conor Dooley" for Patches 1, 2, 3, 7 and 8
> > - Added "Reviewed-by" tag of "Matthias Brugger" for Patch 4
> > - Updated MAINTAINERS file
> >   - Add the path for the eswin binding file
> > - Updated sifive,ccache0.yaml
> >   - Add restrictions for "cache-size" property based on the
> >     compatible string
> > - Link to v1:
> > https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e
> > .k
> > ernel.org%2Flkml%2F20250311073432.4068512-1-
> >
> pinkesh.vaghela%40einfochips.com%2F&data=3D05%7C02%7Cpinkesh.vaghela%
> >
> 40einfochips.com%7Ca7a3db36d4f8414d95dd08dde3dab8ef%7C0beb0c359c
> >
> bb4feb99e5589e415c7944%7C1%7C0%7C638917250735720668%7CUnknown
> >
> %7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAi
> >
> OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> > xy7c5b96WT208HoJvQ03nZR14ZZrsfQaqfpZNdecSXk%3D&reserved=3D0
> >
> > Darshan Prajapati (2):
> >   dt-bindings: riscv: Add SiFive P550 CPU compatible
> >   dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC
> >
> > Min Lin (2):
> >   riscv: dts: add initial support for EIC7700 SoC
> >   riscv: dts: eswin: add HiFive Premier P550 board device tree
> >
> > Pinkesh Vaghela (1):
> >   riscv: Add Kconfig option for ESWIN platforms
> >
> > Pritesh Patel (1):
> >   dt-bindings: riscv: Add SiFive HiFive Premier P550 board
> >
> >  .../sifive,plic-1.0.0.yaml                    |   1 +
> >  .../devicetree/bindings/riscv/cpus.yaml       |   1 +
> >  .../devicetree/bindings/riscv/eswin.yaml      |  29 ++
> >  MAINTAINERS                                   |   9 +
> >  arch/riscv/Kconfig.socs                       |   6 +
> >  arch/riscv/boot/dts/Makefile                  |   1 +
> >  arch/riscv/boot/dts/eswin/Makefile            |   2 +
> >  .../dts/eswin/eic7700-hifive-premier-p550.dts |  29 ++
> >  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 345 ++++++++++++++++++
> >  9 files changed, 423 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/eswin.yaml
> >  create mode 100644 arch/riscv/boot/dts/eswin/Makefile
> >  create mode 100644 arch/riscv/boot/dts/eswin/eic7700-hifive-premier-
> > p550.dts
> >  create mode 100644 arch/riscv/boot/dts/eswin/eic7700.dtsi
> >
> > --
> > 2.25.1

