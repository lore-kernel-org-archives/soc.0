Return-Path: <SRS0=HQex=FI=oracle.com=santosh.shilimkar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA7EC4361A
	for <soc@archiver.kernel.org>; Fri,  4 Dec 2020 02:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8A19E22511; Fri,  4 Dec 2020 02:00:07 +0000 (UTC)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2390D22509;
	Fri,  4 Dec 2020 02:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2390D22509
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=santosh.shilimkar@oracle.com
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B41xnZ5083677;
	Fri, 4 Dec 2020 02:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=kgQwytX7qXW/GdrGFnGsdVO9wDu/0QUsSPDjuT8pMz4=;
 b=orYrYk1CsgmCBUTuinqF31VlB0vCKmbysrP2yt0EpThq/bUcbpb1JPEc/RrqyjlD3d6o
 2XPcoRct1zOP3XBrSh4qdEtCOoWhzCMEQfB/nvGuusltV+UParw4KBXMgEgR3FMgV7PE
 zKj1YyLUkWZob531o/24Rq1IiyU4ybe6kerm3dMSYBl2mbzpI9q6UTTXLF03jehq1yIb
 mnjW5XHYf0dVQr8d4gdOuO1X+RJoO3QHX9e6mJgJ0dDE0495Pwc7VdMRccXFz3tNeSWp
 ZyFoxWMFXK1ho4xMtSu1Lo6kBKI047SPjrGLlGc/p0E38X8w4aWOWpsVsZKnHN0nMYMn vg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by aserp2130.oracle.com with ESMTP id 353c2b95yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 04 Dec 2020 02:00:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B41oW8s185524;
	Fri, 4 Dec 2020 01:58:00 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3030.oracle.com with ESMTP id 35404rpbfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Dec 2020 01:57:59 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B41vtwa015627;
	Fri, 4 Dec 2020 01:57:55 GMT
Received: from [10.74.107.25] (/10.74.107.25)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 03 Dec 2020 17:57:54 -0800
Subject: Re: [PATCH] ARM: keystone: remove SECTION_SIZE_BITS/MAX_PHYSMEM_BITS
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, soc@kernel.org,
        Santosh Shilimkar <ssantosh@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20201203231847.1484900-1-arnd@kernel.org>
From: santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <9f49bc96-57ac-e06e-535e-659c4cb3dfea@oracle.com>
Date: Thu, 3 Dec 2020 17:57:52 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201203231847.1484900-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9824 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040008
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9824 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012040009

On 12/3/20 3:18 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> These definitions are evidently left over from the days when
> sparsemem settings were platform specific. This was no longer
> the case when the platform got merged.
> 
> There was no warning in the past, but now the asm/sparsemem.h
> header ends up being included indirectly, causing this warning:
> 
> In file included from /git/arm-soc/arch/arm/mach-keystone/keystone.c:24:
> arch/arm/mach-keystone/memory.h:10:9: warning: 'SECTION_SIZE_BITS' macro redefined [-Wmacro-redefined]
>   #define SECTION_SIZE_BITS       34
>          ^
> arch/arm/include/asm/sparsemem.h:23:9: note: previous definition is here
>   #define SECTION_SIZE_BITS       28
>          ^
> 
> Clearly the definitions never had any effect here, so remove them.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
