Return-Path: <SRS0=Uajl=HF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874C1C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Feb 2021 12:32:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2438F64F87
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Feb 2021 12:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2438F64F87
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LZzC65prsV5lUEBZgSN7qCrJQjvdCKwT+S8Rvlk6Y9c=; b=Rgk6s9HhhZipM2+oF5dLOk099
	5c3lPwMMMBmFzvXTc/9fniIAJlNZ+jm1NYcVqCBKByN37JTp4E7JteUPs5aaooqIYOTyWtIS0OsDi
	aYET8SftY+Ksca2zxG16fw21bQyCPZ9+QCX7hxFBuUE1rFfOo3yGw/xTiUrvXSmZeFUIzr6ZY+f5Z
	nDMDD/+cHc6eMSoOWhxNL1zL+mhu5rbrKpK/4QqoB7cyw/lDO96a9/lZRqlv5giLdSLPURy9ydzBO
	f6J8MAHFn3deUi3G7Ap3E2U1WHz0HHqmuTKh02d217dnFEkxL6fJ8E5giZd3NfdMQfRcxp+1EqNVh
	MbsKuw7Dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7HJw-0001sg-Jb; Wed, 03 Feb 2021 12:31:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7HJt-0001s0-Tg
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Feb 2021 12:31:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B21B64F87;
 Wed,  3 Feb 2021 12:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612355499;
 bh=oS3ZsFsgy7Rk/fmspwaRx/BuhNweOte4igOFT7mQkIQ=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ViontBEoNtYKgCypK6CzFw0MzVmVDV87NT4nneSXE81Owud7dSdhc7hVOup4Elq9l
 3JNqi2lY5O47PYIAgVE4ZSl2sRbImtjWNaBr5PZSo/LT8c5m70llFa70cBqGUboZRv
 fO4bCuqm8tUQZdqduwR/ubYKPVc58v3JZFsbRdWxtJKMonrhTx56uFfmJ3GUPVFNMk
 etfy6DFF3BDZ+K6batDdlhfYsRi6HEl5ab8YErgvns7Y4B3Vb7l0FHiAmRGZduIm9W
 2XfE2VNGdvM6qfxA5E8Jz485mVhXjhWfNdkJTexzP/Yu+ofqfJoRFYNjk3zbfTdeKT
 +dfjgAR+gnnNQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RESEND v2] ARM: dts: lpc32xx: Revert set default clock
 rate of HCLK PLL
Date: Wed,  3 Feb 2021 13:31:34 +0100
Message-ID: <161235548531.2002750.2897549125435385468.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203090320.GA3760268@piout.net>
References: <20210203090320.GA3760268@piout.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_073142_046747_B36F5772 
X-CRM114-Status: GOOD (  10.09  )
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
Cc: linux-arm-kernel@lists.infradead.org,
 Gregory CLEMENT <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210203123134.ARgAfwMIH5iF9V86RkhRoWodg8MfbH1CrvG8filQDqg@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 10:03:20 +0100, Alexandre Belloni wrote:
> This reverts commit c17e9377aa81664d94b4f2102559fcf2a01ec8e7.
> 
> The lpc32xx clock driver is not able to actually change the PLL rate as
> this would require reparenting ARM_CLK, DDRAM_CLK, PERIPH_CLK to SYSCLK,
> then stop the PLL, update the register, restart the PLL and wait for the
> PLL to lock and finally reparent ARM_CLK, DDRAM_CLK, PERIPH_CLK to HCLK
> PLL.
> 
> [...]

Applied to arm/fixes, thanks!

[1/1] ARM: dts: lpc32xx: Revert set default clock rate of HCLK PLL
      commit: 5638159f6d93b99ec9743ac7f65563fca3cf413d

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
