Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26E7C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 10:25:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5905F606A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 10:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5905F606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EnxvdCuO5RsVz1tYVs6uUgug1VGp21C8lUsX/mYZ50A=; b=QrLsPzrh6PSRJGTKJaJrOGTf0
	9vJ/zYjzP8kiXWTyQcyMBzA4ZXrlTDp6NvDfiTcMMW8OoZh1PVSyMLPovPYUpXGJp9V2pPo1YJup4
	geL/WAHo7kTnjmdhmRUwcfAHhGfPUYOwoDq78wC7nkX95aHnziiatWmgCIdum9Zk3H3SYbWZ/VPVO
	PVnPgkzELE+CaRWbJdewZweR3We0WWACM3dCtrYNW96Jpcn3Xo+xYq+SbHbCHG46vBkFXwbPCGMU6
	W7tucyvPr6O6bCdff5eczZ+IM6tpUTvGv2aMQy38XN23GMGbPD12o5qQ/Tbr/AFQSoqjYGj9ChNBm
	qZGDmB1Bw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRuUP-009ChJ-KI; Thu, 01 Apr 2021 10:23:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRuUJ-009CfU-6Y
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 10:23:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF8116105A;
 Thu,  1 Apr 2021 10:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617272619;
 bh=hg5Z+hZF/ZQdItbgNVCF4+4CNZ+OSHAe2KAz3y+XC+M=;
 h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
 b=SsBBm0EMUhl9/OGwE2f+DhWY9sBp5EJbcZlQdkeuIwcnPC92B6yZdGXq1ca3o+4Xj
 Dxskq/LY5xhI7ZtjO4e3Yp29PT8afnzHm8lKlAL8ETg9HvywtNoIK94Idle4efJ51p
 IsPgryiA4F6QfPBStqpOFOzg4TBYJn7Yf/cYVscMk7a4KtHqVwFNHQ07hhhMbDGkmX
 j6CCyRIH45PSuUDqDU3CS4ZuRkmK2IfnYVbNaDL7HMrAor5UKoLg8R6XzwsgBfdF3x
 96yODsR1TOCcHtNI55mD5BfibeDQaMF1huT9K4MfWpzzrOQc7U3hXvHcqBubRg1J2V
 FHkUbV3b6xsrg==
From: Arnd Bergmann <arnd@kernel.org>
To: Santosh Shilimkar <ssantosh@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jim Quinlan <james.quinlan@broadcom.com>,
 Maxime Ripard <maxime@cerno.tech>, soc@kernel.org,
 Robin Murphy <robin.murphy@arm.com>, clang-built-linux@googlegroups.com,
 Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: keystone: fix integer overflow warning
Date: Thu,  1 Apr 2021 12:23:26 +0200
Message-ID: <161727243810.583633.10194693313914787410.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323131814.2751750-1-arnd@kernel.org>
References: <20210323131814.2751750-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_112344_519031_0DEF120A 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210401102326.hy4s5IsOvoqMr0qS5knGVo3kUob1faDfDYoclVsx5-M@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 23 Mar 2021 14:18:05 +0100, Arnd Bergmann wrote:
> clang warns about an impossible condition when building with 32-bit
> phys_addr_t:
> 
> arch/arm/mach-keystone/keystone.c:79:16: error: result of comparison of constant 51539607551 with expression of type 'phys_addr_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>             mem_end   > KEYSTONE_HIGH_PHYS_END) {
>             ~~~~~~~   ^ ~~~~~~~~~~~~~~~~~~~~~~
> arch/arm/mach-keystone/keystone.c:78:16: error: result of comparison of constant 34359738368 with expression of type 'phys_addr_t' (aka 'unsigned int') is always true [-Werror,-Wtautological-constant-out-of-range-compare]
>         if (mem_start < KEYSTONE_HIGH_PHYS_START ||
>             ~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to arm/fixes

[1/1] ARM: keystone: fix integer overflow warning
      commit: 04e18e1cc319f453a6d752d4553bb3f29fde5f76

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
