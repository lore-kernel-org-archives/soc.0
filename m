Return-Path: <SRS0=P42T=FI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FDEC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Dec 2020 02:01:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C576224F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Dec 2020 02:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C576224F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Du8MQoVkC1Yfv7/rbkvQ7iBlL5FhuIvyAuO+6CGL+O8=; b=kJw9YH7zQNZGnd/mN9+rtPN9q
	jR3vcyJHo44CRyFT8ClOXoSrritKt5U+2f1VONXJ1C9BEIvJxphOkpxCQZDkoJguwWNDHrF4YaSk9
	fqn5UiJ2Z3CPMJ/wr6OHz0/H2SZp4ixoCNyIA1BmVqgNw7uDBjXim2s72hIZ3XWiGOTyytOp5cSJz
	QPmqmnE1KZ009/Po23LyUlGVuxCZMjsczqZ/8u4kiY4OGgG1DX8W2hUZY5/2mz1acAmTvrCAZZg22
	v9WiSjaKZNvEdlOtnfb2HPUOLMI0nWSzpflZhYYz3j7dp5KLxJuNlSLElELbXQjehSVN/htg8scJy
	qrc6lejMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl0OR-0005tW-GT; Fri, 04 Dec 2020 02:00:19 +0000
Received: from aserp2130.oracle.com ([141.146.126.79])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl0OP-0005sX-1b
 for linux-arm-kernel@lists.infradead.org; Fri, 04 Dec 2020 02:00:17 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B41xnZ5083677;
 Fri, 4 Dec 2020 02:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
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
References: <20201203231847.1484900-1-arnd@kernel.org>
From: santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <9f49bc96-57ac-e06e-535e-659c4cb3dfea@oracle.com>
Date: Thu, 3 Dec 2020 17:57:52 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201203231847.1484900-1-arnd@kernel.org>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9824
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040008
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9824
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 lowpriorityscore=0
 clxscore=1011 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012040009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_210017_251948_B52E898D 
X-CRM114-Status: GOOD (  22.97  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201204015752.ioNYq8JoMNxMtC7EUNzmPyoMev9_nfMDO5Ea2KhQAtQ@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
