Return-Path: <SRS0=eMXW=HH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBD8C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Feb 2021 11:36:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2940164DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Feb 2021 11:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2940164DB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s1V3UoWEtAoS1IEsawDdrG0iRurR8FcNT/1IEhRqEwA=; b=XlIwnYieR3QEsjULOHWJzlyyw
	xo8HtQgU5XAptwGhImf+TNaAvicnOY6priGjNZ+fB4MqZw8HGg25/iBZdTZvy9J5z/BRuCPWiB2SW
	ScA3yvlzGNmXRhyuRepfYk6ebsVpykv5eY0smMhetThrF1tYezFD4nLMwoFsMmxugZJ21rPkyk/zE
	NtFm0/JMzgmmqmzawTZVFC353ZjgX08EgxmGWPemmEZ9sXt8zL4R2R7D6vRIK7rzYmuJeZd4HOXyi
	EqG2uJU1XChEMybGwF7Qcc8cr6TKjBuIWVl81UU9eSH96Q0fwHxFpGIRY8ae+YDGMtvaRyGQG4P3s
	HiliB68Yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7zOU-0007DB-2X; Fri, 05 Feb 2021 11:35:22 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7zOO-0007Bm-Vn
 for linux-arm-kernel@lists.infradead.org; Fri, 05 Feb 2021 11:35:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 3107A41F5F;
 Fri,  5 Feb 2021 11:35:05 +0000 (UTC)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
References: <20210204203951.52105-1-marcan@marcan.st>
From: Hector Martin 'marcan' <marcan@marcan.st>
Subject: Re: [PATCH 00/18] Apple M1 SoC platform bring-up
Message-ID: <d7802d11-ce90-5645-1636-7f75a7a0694f@marcan.st>
Date: Fri, 5 Feb 2021 20:35:03 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204203951.52105-1-marcan@marcan.st>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_063517_152037_8E6540AF 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Alexander Graf <graf@amazon.com>, Olof Johansson <olof@lixom.net>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Will Deacon <will@kernel.org>, robh@kernel.org,
 linux-arm-kernel@lists.infradead.org, Stan Skowronek <stan@corellium.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210205113503.YMv-Jgw_6BLzV5_XgpfKsyhLVeaw4YZgs3d2IWYElBg@z>

On 05/02/2021 05.39, Hector Martin wrote:
> This series brings up initial support for the Apple M1 SoC, used in the
> 2020 Mac Mini, MacBook Pro, and MacBook Air models.

Forgot to CC: a few folks involved in the previous related thread, 
sorry! Adding them here, hope everyone got the series via the MLs.

v2 will be CCed to everyone else too.

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
