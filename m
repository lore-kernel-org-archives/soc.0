Return-Path: <SRS0=45Hb=E5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355DBC2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 16:51:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA8DD2080A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 16:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bX/6ZWVU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUmq0IK7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA8DD2080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ua9gxx886EQLbDNexKzdnxcjXNmOgiS0d63ANKwjbSw=; b=bX/6ZWVURZrZMtWHUwM6fUpOH
	drIJxGAXtx1j8ftiDj0XyylPaA4cBwfI2qVSfoeHXWCg+e5H00XS/6f9Io+CaNT6t8Ef9m4D/FBdo
	kYfvSM5j2/dbOuz+BGKYWBT5QIMYTA/oO0cfiWmoHXgOA8lsvjA8/23O7K8Lqwe3WiM1Kz4da4zBG
	6p5cly557NPoAcwBrbTs/Vc/v++abYdIYF/cyeRu5lmj62NdOMsgvN1piOL7si9MmW7WN+cACOjdJ
	Ev1Rs9zJf6xx68eekeYmKKQ0pQB/7YR28JtEwvBX6Bq5RtI1Q5wKo+HosBezZsmlDNeK2ql2nRHid
	Su7Fo5r5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khF3s-0002m6-N6; Mon, 23 Nov 2020 16:51:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khF3f-0002iX-CV
 for linux-arm-kernel@lists.infradead.org; Mon, 23 Nov 2020 16:51:20 +0000
Received: from threadripper.lan
 (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E2C02100A;
 Mon, 23 Nov 2020 16:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606150278;
 bh=IJLsfoiBXLZdNhTBNGvXW4kWo9aqLbAR3Z4WPpZb1rQ=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lUmq0IK7PLLXYu/ReMk9UlTAqPFnD75ayfPxEIN5LlF+kxxXE7KFpwgFDyYMDQKcj
 lMKw2p/rVqZca+b55hbB13dMZLycjAi4HV2SwmIh0BFneHgZ1qt9c7OVMLvHHNZOaO
 23bZTBOPDnMufrvvztEqRuHsxdzbhH+0ubSuZ9Rg=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Linus Walleij <linus.walleij@linaro.org>, arm@kernel.org
Subject: Re: [PATCH] ARM: config: ux500: Update U8500 defconfig
Date: Mon, 23 Nov 2020 17:51:08 +0100
Message-ID: <160615024268.69722.7470097751906035307.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201105134510.1417639-1-linus.walleij@linaro.org>
References: <20201105134510.1417639-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_115119_574988_3EC45704 
X-CRM114-Status: GOOD (  16.05  )
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
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201123165108.wVRABkVSsN-72NzyfojPBK_re5SuONWYu0fx8RdD730@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 5 Nov 2020 14:45:10 +0100, Linus Walleij wrote:
> This updates the defconfig for the U8500 platform with
> some of the changes from the v5.9 and v5.10 kernel
> cycles:
> 
> - No need to select the schedutil cpufreq governor
>   because it is the default now.
> - Enable the CY8CTMA140 touchscreen as used on the
>   Samsung Skomer GT-S7710.
> - Enable the Samsung S6E63M0 DSI panel as used on
>   the Samsung Golden GT-I8810.
> - Enable the KTD253 backlight as used on the Samsung
>   Skomer GT-S7710.
> - Drop CONFIG_USB as we only use the gadget mode of
>   the MUSB driver.
> - Add selection of the CONFIG_LEDS_LP55XX_COMMON
>   lest the LP5521 LEDs will not work.
> - Move the config entry for CONFIG_DEBUG_FS.

Applied to arm/defconfig, thanks!

[1/1] ARM: config: ux500: Update U8500 defconfig
      commit: a65183ff1535ed15c28c526f6b69ed03c21d34b4

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
