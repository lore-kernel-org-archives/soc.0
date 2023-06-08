Return-Path: <SRS0=uoyY=B4=amd.com=michal.simek@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8198FC7EE23
	for <soc@archiver.kernel.org>; Thu,  8 Jun 2023 11:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47762C4339E; Thu,  8 Jun 2023 11:59:23 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0BEBDC433D2
	for <soc@kernel.org>; Thu,  8 Jun 2023 11:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0BEBDC433D2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rrp09fuRado7kKaxamU/iLeM/liis50WE4RHy4CNGnmcSPUDCXhyrlvYyB9rzoOOHHeYIwWHnHE4h9WyyaNqLLfOk/YoA+845glURXjBZDyagVW78zUHR0DA9olXmDBbypjlJ6k1z29fwqTGWP3Cad3CWWeNxc+ijk/QlesAB7BpFdbFdQMLihoNeQVaIVCu0+hp37IiyL+CqQuwr8TB1ihb0C/ahoKC+2H9wUAV/qLaFXsWpsE3SwHARnrnpW6ozdrExRLF4tUb541OeWoTggk4XdEanSpg56k46M3XiXjCMD1fDPsepLIx6ZPWCJKDiDTjElZXBF6TWr1wOGJ0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y23y2OvD92p0gfkv+ZqTxYIdEDYqLL6TMEmaDJun6aQ=;
 b=Yp59V97FBTe4BTnt2GMDU43XU8/7PEMR2aSMa0f8meE7sA1L44+f1unq7xF88K3chMbAgxopxc8d3Ipsa/eymIAtEzyCEvEfjD7yQ9Ao7YN3sWkzLio8bdNQo2Q0JzvBYdFF79+c+tv26TDYV0AfpAiFRsIrdRQxoasYeKiptWHnQ1VH+bC0P5l/JXro+7VBGErGxbcZTG3XsdwwAVaAK+LGfqpf0bVQRUYiGYFwIR375SJAPuFIJ9iiSBLHIrNV2X5te8VzhFV7LWb2RTHXeDDpJ8WLSsWRXgyQggG+QkDH73ec71h9L4pD+tKpr8SbqkBMNdaPT7FzjHNPjebnJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y23y2OvD92p0gfkv+ZqTxYIdEDYqLL6TMEmaDJun6aQ=;
 b=DopV+X6cSiaVdaGQdW31UDnGdKPXlNPUUmzkdYENEOcLzv7CAGWLIOg9U62rqIub6ucH8jUXQO9w+jsuE567Owx4VVCmr8iuH5vg693mR6n2meO2Uuk8Wi8t9GqPfivFHl0y5uyEKVmKCaW1n+s+CVGKQHS/rQdIw70CyLAuups=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by SA0PR12MB4448.namprd12.prod.outlook.com (2603:10b6:806:94::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Thu, 8 Jun
 2023 11:59:18 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::6ad5:3607:d622:669]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::6ad5:3607:d622:669%3]) with mapi id 15.20.6477.016; Thu, 8 Jun 2023
 11:59:18 +0000
Message-ID: <c5c99ba2-f004-306c-6251-551826f90df8@amd.com>
Date: Thu, 8 Jun 2023 13:59:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: "git (AMD-Xilinx)" <git@amd.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <michal.simek@amd.com>
Subject: [GIT PULL] ARM: dts: Zynq DT changes for v6.5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0218.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::14) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|SA0PR12MB4448:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dbaf616-1428-45b4-42e4-08db6817c9df
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MIYArr4EtccvGcjwUn4JNsIRfYTDAEM42KepSAeBJe0eyOYyF7+W4G8mZhORzMmvl5JKnqmMCGh3OFJcYC00j5HRlvOor1yVfufHmv1B7b1k4wOd78VW+9Ei7menTdlyKIkqm2hbj2IuM0ItUeXl3eOfuvj97BTJsERTqvEgZ4BG6SFJDb9svnaUPYBuPe2fYPgjM289Cr9GEbBPNHYBHWOBv3Nr8IbjXmlzy42+HOBLRklZ6j92Vkl9B5TzFLcFrFDJHREiEE+KaUpt1rt6pUTZkbvAunZe3p8rrTmjXL+KZxx41eV3KIVs2FbmYMIl6YSXbh0jkAv6Ld7Eoi0dTJjm48A/ZzdbVZ4r2GrSVhOfahvBFNcxYOFsB8nNyF8112UjYBHtI9s4tlE6ff7fXEHjAVyfqaEW1Z04ObTxn6n1Ks5rIMzbOtODKG6Bs+bOmbc+OHoyk2i+H785MIlQJcmSGttYOiQVk8w3Dz0JrMfWakTS/p1LTEPmboCLESEZ96hrIkLYDIxDSDwoT4xjI/OBS4WUbGz+hXnzWLRR8dGle3u4/qqV1jB72lNHb/TIdM3rVeOyQSZaBPJ+CIxK1kjYbmaRjJMWvbKXPmYPk2aEHCjCPUOrgXoT/kOWAVIXvZ8mnTZA6/dKImnf6Q/+aA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4758.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(86362001)(186003)(6506007)(6512007)(31696002)(26005)(966005)(6486002)(2616005)(31686004)(83380400001)(6666004)(8936002)(8676002)(5660300002)(36756003)(478600001)(54906003)(38100700002)(4744005)(44832011)(2906002)(316002)(66946007)(41300700001)(6916009)(4326008)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3NqZGVud1RwZkFzUW1tSnliN24wRXo1SlNOVUQ3cUFnWnpDcXQ4Z0VIVC9p?=
 =?utf-8?B?QnNQZGdPR2hoY282dXdkc0ZpbTZ4VGEyOThiaWZlRjZVRzlRZ3NDS051ZHBW?=
 =?utf-8?B?c0h0SlgvSlNVV1FxdkoyNWNtVmhkZHJrTkQzdm53dkhGTEJyZFRabTF5ME5X?=
 =?utf-8?B?bUdzOC8yNnFHL1NlWlVhRU5JR0xTT3hnR2gvTzVnT3ZpemFTbXFITzZNSm1j?=
 =?utf-8?B?TytzNGVCVllpTUJaT3BlZWR5YU1NaDFJbUticjVzY1NWNitiT0xIL1hnSSt1?=
 =?utf-8?B?U3ZPUFNJbkhiUVhWNFVCUHVwMlc1TlVMZ05nNjBsbkQ2ZGNYUlhROWNsVkhF?=
 =?utf-8?B?QkRKaFRzNUpsSnVFR0dtcTdhK1FCVVdvOXE5UEtwUHdsNmo4YXI2ZlhxT25k?=
 =?utf-8?B?VG55cEdyS1VrN0pWWk1IRHZxRmpiVmxkNEk5ZHVIU0EzR0hDU3hoazhaMisv?=
 =?utf-8?B?eEtBRWRxQ3RLdnNJVGIzaDFESDBKSmloazBCUTc1RXk0NmdaZWxQOFRPRHFu?=
 =?utf-8?B?azV2TGNCeFRoRjZQZHMvNDNhbEs2VlEvZWVITWZzVnpFcmYzUnJLMGxRWUlz?=
 =?utf-8?B?VG9wT1JKQ1VPQ0l4QlpFWGs2UGg3TWE1cVJJOW9qOWdvOG9mZkFISFo4N1pL?=
 =?utf-8?B?ZkUxS29Geis4VXZhTkp5ejRQbjA3OTg0LzNTK2RMcFJlSjMvcC9xN2t1dnFE?=
 =?utf-8?B?KzU0NUNyNWpFbkMrNmNJREd1STdjb2svMTNtYUhPT0M4dFZTMm03TlVuSnRy?=
 =?utf-8?B?TXlXVU1HYVh4ZzdjV0R4VmZpU2ZuMllQNXNOQ2IyMzhSQ0JIMFY5MStwazlH?=
 =?utf-8?B?Q3BhMUVsV1d6dkFwbmJZR2s0MUQrdlBLU29BSnBQMmE2UkYzdXlaYVIyMEpn?=
 =?utf-8?B?NXpleWt3QkJ6U1pSZHBnRGMwVmwvVUlubk1GWll2cVErYmlFbktzOTlTQVFx?=
 =?utf-8?B?OWJCWDRyNlNZMmJuaTVqYlFVQkN2VVFwZldHWGY3R0xsRkQxL09uUjFEb3N1?=
 =?utf-8?B?WFRKOG5pYTVSVGN1azR4d09kZmp0VmpTVk42SGV5eUNVbXBkYVl6eUZIRnFV?=
 =?utf-8?B?c2FkWVV5OUNXNndGR1YxYklEUVRiemR4YjZuQVNqNkZnUUI0V3cxVHI4YVVa?=
 =?utf-8?B?ZkhEUjhZSnRYZXgxYi9VTThRRzlkMWYrR2dtL2l4WW5wNitJY3BoQStEdlhZ?=
 =?utf-8?B?OHBKNlNNNUw3bkhTc3dzaWxOQmpJSDhxT0J4Zm5TWlBsZytFWjByeFcvd0Ri?=
 =?utf-8?B?dXlLRXJwZzZ0QXZsemZQNUFVb0YwTmRiRDVSaUptYXBhenp1eUwwdHZ6NnQ5?=
 =?utf-8?B?NXY4eVBzc3dhNFowd1JtMG5Na3JJdGRBQ3NDOHBCeG4wMTNIRlc2VWVjY1pq?=
 =?utf-8?B?SVkzOXZwQkg0dlJqTVVkRStKRCsvVFFxL0xyc3JPbmtNbVk1alV3UzNvV09v?=
 =?utf-8?B?ZjFIdTgrWUZmWGViNXo3am1aMXdDU054VVMyQmQxSytKdGhRN3RaUWNLY0Ji?=
 =?utf-8?B?aG9NaWVOdTRBN2luRDFBMEJLRW91T05CWHNSUUwxS09EQTFrRFRVSUI3YXZw?=
 =?utf-8?B?LzVzcWEyRUpKOThiTW82RFhuMHVzL0VhbjB5TFhsclNtOGhPUnNyQmZsRi8x?=
 =?utf-8?B?TUlObEZaKzJqQi9zaFROeDNZY1czT0NZRFFDenA5QUlIbHNTTDhTRWw5UzNN?=
 =?utf-8?B?Y3BudVcydFVXeTRMb21FTDN3dEJZWldpRTU0T3dGNzlMd3ROQkNhY29NMFJt?=
 =?utf-8?B?ditWSjAwWUljcFdDVG5RbTdmQlV6VkFSQWV0UnNDUVlleWU5M1QrbERnQVlw?=
 =?utf-8?B?RXBGVG16b1dKQzFKVGN1QU9WSzc0bGRZVkZ3aXBYQnhscG9kb1NLYU03M3pE?=
 =?utf-8?B?VVBHcXdYUzBTYzgwSFJwV3ltSU1oUWpzNjR4eks4Z1o5WDZwa1FWWVBad2hr?=
 =?utf-8?B?dERScDVFMmJTUkEyNVM3TkJUaXVuc0Z6RU93Wmo3M29lZHhiQVkraGkwRXBx?=
 =?utf-8?B?dGhwclRvek5xODdJcnc5RUFxVnZhTWNEUmFKYWZEMDltVis0M3E3MmhkcDJq?=
 =?utf-8?B?Ri9PaVpGNGRNRmNoU3ZaamlNbDVjSHdtL3dmajJuZnJ5a05qOTJRS1JlcG5Q?=
 =?utf-8?Q?7OY0krZ2ByB/lZUv48+n1ACFR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dbaf616-1428-45b4-42e4-08db6817c9df
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 11:59:18.4326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUZo4FfIP8IroOzMlphQ6IzWSUVBkBREBKXy+Y71QYZKQBotg+Ot2QjMYnkRmLb1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4448

Hi,

please pull these changes to your tree.

Thanks,
Michal

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

   https://github.com/Xilinx/linux-xlnx.git tags/zynq-dt-for-v6.5

for you to fetch changes up to e2ff42b4f1caf37ce8fca06f69e4970d6fa5ad69:

   ARM: zynq: dts: Add SCL & SDA GPIO entries for recovery (2023-05-16 13:12:52 
+0200)

----------------------------------------------------------------
ARM: Zynq DT changes for v6.5

- Setup 400k as default i2c frequency
- Wire i2c recovery via gpio on zc702

----------------------------------------------------------------
Chirag Parekh (1):
       ARM: zynq: dts: Add SCL & SDA GPIO entries for recovery

Varalaxmi Bingi (1):
       ARM: zynq: dts: Setting default i2c clock frequency to 400kHz

  arch/arm/boot/dts/zynq-7000.dtsi |  2 ++
  arch/arm/boot/dts/zynq-zc702.dts | 19 ++++++++++++++++++-
  2 files changed, 20 insertions(+), 1 deletion(-)
