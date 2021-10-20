Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AC4C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 16:02:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F4105610A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 16:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F4105610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7/22yNlDpSE0b4YjOzs1XBNtbfNiC6lT2jlXB5ekEQ=; b=20qqfnWZXlI1LF
	bmY7KynfsFCrzY1GankToXfKmdVpZ7U9xHPuIi+65l5kUI7AhTtQ/sd74yhiOkekiMHBvOZBwcSmJ
	hszzKfe7aHLUQPd7AeDs/hPWpsHY90AWxw1coWhE7vD+XOIl6gFEz5NEM1WC0FMB/C7sw+sfhrhap
	mcE9EVMFRol40ZFo5d0UjfA57l3Y2KSZ1hKbQNpv6acBH4wwJofnOBBU2KF83wC5QxeLB8R3VVSY5
	OnDnbo1tBfltjwA7VmVL7BcFELUnMXn+Dwm6faJm7W7NCWeWtUHOUtqycQxi7q7rIY1WS1+oOg1eu
	2FahEbGVdFIc/OFEimXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdE1C-0059wP-NM; Wed, 20 Oct 2021 16:00:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdE19-0059w0-OD
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 16:00:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82FF8611F2;
 Wed, 20 Oct 2021 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634745638;
 bh=yZQGqcixn3akt3DO+10qEkc/glUASyUfxkV9M8n6qCc=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rjt9JHUW7MQXkOkcU+8UEdlOyGBRl7yVL+E94b+xSJ5dQHIrlLkVTRtf29Wd/VLB2
 A7/QP51NKa47c1EymIrdVwvzHHMu6d7lDcxXEJNAGJmOc6mbLCCk5k0YnjP9L2hfQe
 UzBRl8dXLtF6i6mbyT8dltAzy0mTIaD3d8a/bhEHltOds57SjD1ElmX0KCtWA36KLX
 h3mgWwwuOJjzrDL/4ffEb6woupTaTuceG+8MvBQ5T9YRuJjGeVSJA7cVRiVX+2hZoT
 SBAotHk0MO2QxQaGcu3F+JlKDk6DdBODZ8+UPno5XJrAtMWWbjswQeoo/oMfZizaLF
 ChYR4Px6Hb4Fg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Nikita Shubin <nikita.shubin@maquefel.me>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] arm: ep93xx: CCF conversion
Date: Wed, 20 Oct 2021 18:00:30 +0200
Message-ID: <163474562303.2274953.3990592094326359852.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211018103105.146380-1-alexander.sverdlin@gmail.com>
References: <20211018103105.146380-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_090039_829667_D23B5155 
X-CRM114-Status: UNSURE (   9.77  )
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
Message-ID: <20211020160030.Lz_LwK1l5HxR1HeCJfMaCjkaefoR710xtL-sA_GnX8I@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 18 Oct 2021 12:31:03 +0200, Alexander Sverdlin wrote:
> This series series of patches converts ep93xx to Common Clock Framework.
> 
> It consists of preparation patches to use clk_prepare_enable where it is
> needed, instead of clk_enable used in ep93xx drivers prior to CCF and
> a patch converting mach-ep93xx/clock.c to CCF.
> 
> Link: https://lore.kernel.org/patchwork/cover/1445563/
> Link: https://lore.kernel.org/patchwork/patch/1435884/
> 
> [...]

Applied to arm/drivers, thanks!

[1/2] ASoC: cirrus: i2s: Prepare clock before using it
      commit: f4ff6b56bc8ab2fcad6885813cd28ccc81224981
[2/2] ep93xx: clock: convert in-place to COMMON_CLK
      commit: 9645ccc7bd7a16cd73c3be9dee70cd702b03be37

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
