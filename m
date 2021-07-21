Return-Path: <SRS0=x48B=MN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E88C6377B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jul 2021 20:26:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 376AC6109F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jul 2021 20:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 376AC6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrqBDCFyQ135x9yCdukjGnOekDoRWxPT0J6yoN0Y3J8=; b=ulkyt6ALrZOy9G
	JQLSLEOGVh+gtcudqVMcy44QSrV9Ih0hq8TLJVAK7+3ibd99NHnW7g7cNhs6ywIPz5EPhCvFnscpH
	YonbmJygTk+nNR5QML5lhCM8xcpxBL3UR/qGKi7vfsfhM3RkR0PvsvgYZchuBlUxmD4O24Jjl5r+H
	lzX6g5/4dPEjrMsFEpWwCsBA2mj39mMHX++oyG7Om/r+qOwIIhuMdFbaKsrUnvMeM+BvPp8M+XXgb
	mBMqein0w8PM4Y5wBDw5wgnX8ga/+0B7227A3472Pf3WRQbkrq6gSxk2SeAgEbqvZOfH6K+LTmh8+
	6/65yYSXpKdGkR4kftDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6IlU-00H6tN-KV; Wed, 21 Jul 2021 20:24:24 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6IlQ-00H6sV-8B
 for linux-arm-kernel@lists.infradead.org; Wed, 21 Jul 2021 20:24:21 +0000
Received: by mail-lf1-x135.google.com with SMTP id b26so5077245lfo.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 21 Jul 2021 13:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D1fSEVFqUHw4YbE91AcPQyxQQAoQKEf3Quu62fEWYpM=;
 b=eNPhHfJRAQmHqXGo9tKdmBMr74Yzifs4VEpKtVWbGpAw3a/ia6SnGPHN++Kg8qNYti
 C2LVca0Zr+CXXv9RqN+9hrUMF8Dy5GlxC9gO2+cGGRoLca9eyCTkOiQkPm+LMc6HAe9K
 LxdQgK7NHnJd5T1mUubdTOkVkknGaQKzOzFIzFfZV6bZFL/L47auyl/st/0JMNR4b5Wn
 qy8/dPed+bfqT0AnW/VcqDSrlSFJ+mxn1G/89uIDBwPD1ADuA/q45pw1K0bH2X2TN+Tv
 MJA+qsN0kRCWuq9Pm1AadJdT/Rce3ppBKvd+S0Ib7jw9IABUZiwoyQ3HC69WF1Jn8Yp8
 Y1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D1fSEVFqUHw4YbE91AcPQyxQQAoQKEf3Quu62fEWYpM=;
 b=UDtwjh0lSQXy/VG8l5ciX5Eukb8/t604AVd+rpuMQ6bShme6lTWRuVNu3AtCTgJP/+
 ih6eWCo3+2XJNyZKg+9daW4vq4Yffll/vTY4FXbPvfhHAWDKFxgHa99MwKz/rhJTxjSn
 gblBH+wYB+CuiJsKPeO92oN3gU7/Su30A8YRnY4CUaRucsRCp6c1m/ZrwbWIICUoIdsc
 ppkfuh0nmXI/ouPMCH3WtYSrnnNm4yo+pfZVrYfvpzn2SvqdEtZR1ZNwmndkiRK0bj5q
 iycyWwGhOf2B5OM8SVMvMqTk6uODbrErAmL+a7a4fz1+LUBL1t0II7BPDXFV3NNA5Pif
 SmIQ==
X-Gm-Message-State: AOAM532gjLzvg+mNZiceHRsHxoQX+rbNKX7vmXb/nk/S/3lEQR9PVxio
 f144cjqDVHByQhxIN9GF4ZEP0uTFOSxllToZAAXmPQ==
X-Google-Smtp-Source: ABdhPJyGeXguhortkkfg6BjqS34WA20M1SIfJqsW4mpXW18zkOgpVQv39lVckpNO2cFGBH/aqAfnxROqkwH5q24AkQI=
X-Received: by 2002:a05:6512:169e:: with SMTP id
 bu30mr6326301lfb.291.1626899057636; 
 Wed, 21 Jul 2021 13:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210721151546.2325937-1-arnd@kernel.org>
In-Reply-To: <20210721151546.2325937-1-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Jul 2021 22:24:06 +0200
Message-ID: <CACRpkdbuXkvOkMNizqmRPwuYz-YU8j-yidtXsOAmEd4z3B0hVA@mail.gmail.com>
Subject: Re: [PATCH] ARM: ixp4xx: fix building both pci drivers
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, SoC Team <soc@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Bjorn Helgaas <bhelgaas@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_132420_355379_3BDA53A8 
X-CRM114-Status: GOOD (  18.54  )
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
Message-ID: <20210721202406.fHWUdJsk9KknMjEylJmoZSy6N9LOPZA-3ZCulYGnyls@z>

On Wed, Jul 21, 2021 at 5:15 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> When both the old and the new PCI drivers are enabled
> in the same kernel, there are a couple of namespace
> conflicts that cause a build failure:
>
> drivers/pci/controller/pci-ixp4xx.c:38: error: "IXP4XX_PCI_CSR" redefined [-Werror]
>    38 | #define IXP4XX_PCI_CSR                  0x1c
>       |
> In file included from arch/arm/mach-ixp4xx/include/mach/hardware.h:23,
>                  from arch/arm/mach-ixp4xx/include/mach/io.h:15,
>                  from arch/arm/include/asm/io.h:198,
>                  from include/linux/io.h:13,
>                  from drivers/pci/controller/pci-ixp4xx.c:20:
> arch/arm/mach-ixp4xx/include/mach/ixp4xx-regs.h:221: note: this is the location of the previous definition
>   221 | #define IXP4XX_PCI_CSR(x) ((volatile u32 *)(IXP4XX_PCI_CFG_BASE_VIRT+(x)))
>       |
> drivers/pci/controller/pci-ixp4xx.c:148:12: error: 'ixp4xx_pci_read' redeclared as different kind of symbol
>   148 | static int ixp4xx_pci_read(struct ixp4xx_pci *p, u32 addr, u32 cmd, u32 *data)
>       |            ^~~~~~~~~~~~~~~
>
> Rename both the ixp4xx_pci_read/ixp4xx_pci_write functions and the
> IXP4XX_PCI_CSR macro. In each case, I went with the version that
> has fewer callers to keep the change small.
>
> Fixes: f7821b493458 ("PCI: ixp4xx: Add a new driver for IXP4xx")
> Cc: soc@kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I tried very hard to make it impossible to build both drivers at the
same time :(

Oh well I guess I failed. Kconfig ... say no more.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
