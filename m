Return-Path: <SRS0=x48B=MN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A07C6377A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jul 2021 20:26:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE18561221
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jul 2021 20:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE18561221
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88zrrARUtdniY3agOqhQKZBNFTnBnB1pp20/Kefw9qo=; b=oE5KvU2rwYng7z
	NhYrRqjjiTJbUl++qbRGQZkbMvnnq8q1V3ge6RdWb08YELj8UIViNVXgBssSN7fcbIBuQ2RJZRZ/Y
	eBzA3kafvCauyXEjciexuXJGyAdlXl5+8MpBzeRg7VFm5jO8Z2w0+Bmyt9Zd/3hySa3zAgCjq7Y0k
	7sFPvggabdcw6rw6NACRaLNdRlRLC7VIcpXjAsEVFb9ivChh/imgPU7aCX4kP0i9zxxoB6NeSmtXW
	UdJujZS8Wi8q9c+qRI3b82bNTNQ5wKm33L23bHTE/UvGXXktM2E695ZiZTVmsNRQwmsQvl/S7242i
	T+nXbaShbaEZHXZp3ipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6ImL-00H71X-Hv; Wed, 21 Jul 2021 20:25:17 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6ImH-00H70R-AM
 for linux-arm-kernel@lists.infradead.org; Wed, 21 Jul 2021 20:25:14 +0000
Received: by mail-lf1-x129.google.com with SMTP id i5so5093287lfe.2
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 21 Jul 2021 13:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MjXDOWyd73wlu1QIRqgI71CqpEzm7Ck3HKRbigN51sg=;
 b=kQ6TYLiVfqICNhW3OwZxp8Qfd7xGJUzTJ1xFrBLx5DD2I2xKISmzOkio1Y72PHh0B6
 Vu31dkKMQK56+NS8E2axT060bnbg8hN2uDHiYpRDnoA5Ge0mTiVIL30vY3OMxRJXPr7x
 siTcNehJaQOMOjVXDVAGpHOUf6KCLhER79LafdIb4rV90jtBPOkPy6dStSKOGYECGzWm
 HcHeLqJy/y/MJZ21LtTR62ZAkSgL9KdhpEfsLC4XcPlP3lzLOKyo0Q/PBTP6cDDQAkQ9
 QjpJlWl+DIx5eQpnGHf7N8XSiJKFd6JSFcLTqHiX4Cdh04M/rqRYXDHePDNakG7+eZE3
 p6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MjXDOWyd73wlu1QIRqgI71CqpEzm7Ck3HKRbigN51sg=;
 b=Q7C7TEyAJH0q8u/kwlRa/rs6hgYah+vE5A+6eAHxhiWDzxzPtEpBuF+4DZvvQvBFjH
 OsHbHgKW6NGtR3xtDIujHsnmoY88gzfedCf1ej1CmYFJv4DiLkRRQCvFgOt+nwrv0daO
 PSRzS9N6ifCsvEJOajejeh52WYmzwOFkr8mz25E5VKq9SEmG0O6EqTvTZ4aunsHH/KW8
 syuAx8fhq6MGyDEjT6rI8Bx0sSSjz48h5BMzOmmFjvdC4lNflHhufQi0HekOJ8jwS/M/
 LYQ/NC4cuC2Ye2x+0y+U2AdOtVriGvW3xnf3ks8VrtvbKuyM00Efbaaso4LihyEqX5rJ
 Ilwg==
X-Gm-Message-State: AOAM531EyfUHAkq8kzUr3+UebdZIvAt8IbGw/5zVk5On/Lm9y9M6/rA3
 UD5ciLPNr4NAIXXDy5yaZLi2EhDLp82y28UJQXIgrQ==
X-Google-Smtp-Source: ABdhPJz+Ibpdq9t9/cUreWhO5XZT1p+ryHZn3jXNVmSjN+McdT77o4jR3PjGVJNH4azveTk6PTf1wq1eqskPw47GurI=
X-Received: by 2002:ac2:5312:: with SMTP id c18mr25904144lfh.649.1626899111566; 
 Wed, 21 Jul 2021 13:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210721151620.2373500-1-arnd@kernel.org>
In-Reply-To: <20210721151620.2373500-1-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Jul 2021 22:25:00 +0200
Message-ID: <CACRpkdbpb-mVHQackyJM=yP=TS2c=6zM+ZXfbHZPWfR6cR+xUw@mail.gmail.com>
Subject: Re: [PATCH] ARM: ixp4xx: goramo_mlr depends on old PCI driver
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, SoC Team <soc@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_132513_410356_DF6CB2AA 
X-CRM114-Status: GOOD (  13.97  )
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
Message-ID: <20210721202500.Y59gdV7BDpfxP51rLH8RzL4VWo5uqMR50vxmyDpJVZs@z>

On Wed, Jul 21, 2021 at 5:16 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> When this driver is disabled, the board file fails to build,
> so add a dependency:
>
> arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'gmlr_pci_preinit':
> arch/arm/mach-ixp4xx/goramo_mlr.c:472:9: error: implicit declaration of function 'ixp4xx_pci_preinit'; did you mean 'iop3xx_pci_preinit'? [-Werror=implicit-function-declaration]
>   472 |         ixp4xx_pci_preinit();
>       |         ^~~~~~~~~~~~~~~~~~
>       |         iop3xx_pci_preinit
> arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'gmlr_pci_postinit':
> arch/arm/mach-ixp4xx/goramo_mlr.c:481:22: error: implicit declaration of function 'ixp4xx_pci_read' [-Werror=implicit-function-declaration]
>   481 |                 if (!ixp4xx_pci_read(addr, NP_CMD_CONFIGREAD, &value)) {
>       |                      ^~~~~~~~~~~~~~~
> arch/arm/mach-ixp4xx/goramo_mlr.c:231:35: error: 'IXP4XX_UART1_BASE_PHYS' undeclared here (not in a function)
>   231 |                 .start          = IXP4XX_UART1_BASE_PHYS,
>       |                                   ^~~~~~~~~~~~~~~~~~~~~~
> arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'gmlr_init':
> arch/arm/mach-ixp4xx/goramo_mlr.c:376:9: error: implicit declaration of function 'ixp4xx_sys_init' [-Werror=implicit-function-declaration]
>   376 |         ixp4xx_sys_init();
>       |         ^~~~~~~~~~~~~~~
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: soc@kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Ooops
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
