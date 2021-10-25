Return-Path: <SRS0=GqV7=PN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C23C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Oct 2021 00:06:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB19860FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Oct 2021 00:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB19860FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipobRL2yBnZZGISjNn9Y3+bAHUhSHVPVh/c1/B0e/YQ=; b=NhZUEUMKm2+QjY
	EfKIpDQ7ksYL7O9JR+KS4OF+5Mapoj0hriJulfwUxz58wMS/4M9hcQV+KgW5Z810G7fCY2YY8OWWt
	beezR/VV+Op6Rf+e9+lprIiGy+2hAdByI/EVRtyTSjvSeQVET2hNL0yOKA1Lwh3MBiU9kD5NpiVP/
	DMwS2UVmjlKwa1fZRZd6BAfUQs2WhcnRIge+Lpqt4DvmcF7YXeSgpbbKhdkWo3XqUHUwOCmecX0At
	3QV2a3JiIyiGDvdi4DDk1YaYbdAuz3+8g2g4oBaGMwsOlG/rhKZZ4jya2fYN/NOnNQzvcUyYWbuQM
	3OxguK+9vVdjGD50AASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1menUU-00EoGf-Pb; Mon, 25 Oct 2021 00:05:26 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1menUR-00EoGG-BS
 for linux-arm-kernel@lists.infradead.org; Mon, 25 Oct 2021 00:05:24 +0000
Received: by mail-lj1-x229.google.com with SMTP id n7so6243179ljp.5
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 17:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BXs3CPiRM0ktOPn6UKcTUaxBGbDFvG7y/D+eqfm+MiI=;
 b=EcqtqNeLccqZf+cv2/s25z9obdQyXFWwESdFctu92gglRQdTZilo0i5mW9ktv1CRSH
 8gcQDYNEbRGQpjfxp/u/Yp8OfTvFYkgPPwTw3RVE94rCfUxv5czaERJlokO+/zV83QrX
 RHKWpBeCyAIc+olrONkEnxnO7XgRReItJ9JV7LzvfQmiPxP3KKvNqP+/d+eFPXaywCEc
 TmyNwQm0YDxuzkNjLlb3wIDsjPypsGNEoyrbdKGB2nBh29/DpGCiwy3vMVKw3nmLcMhp
 /ycA5xhEyOFFyCUim9WUoTxrNWHnhfFLM1Xh8aToH0Ofnzpg5W53/HmH2Xlx4gp07260
 1vnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BXs3CPiRM0ktOPn6UKcTUaxBGbDFvG7y/D+eqfm+MiI=;
 b=rTbUAXNcP2fShdxcFT3DbYAjCguVpz7It8ovIgyCOrwNqMNmtOwegqI+/JzijRZktr
 9coJhN3oS+UBL7UTIMS2KIykK26z5rXnugfG2QBR03Ae3DLXKTs2XyrLiVk4x74MGXkd
 HsSCvI3frqwfdHM3NsKAfynH3dDrhzBgSO+WWKwpXe367F2X/nT2vro35DjCAvz3Sz5P
 V9EzQ6M5nbUlAvrx6Q/MDQI24u6I+/3JVxn+Ce3SsnsR6TMuyjwha/o3Qa3oU8m/3ojV
 KhNo+t7+IosueL4GPFCJ6+rvRxjiwDOKmcm93/v52oA3q/FONf4EPTUf4EH2JmXnAF0M
 8z+Q==
X-Gm-Message-State: AOAM532wlC6DAlgYQ8spqi0kFquadYR80hsmtqVw4uOzss5mTxR8aRNT
 lxygJ6sqZqSTo5GAVFtjGwHv6YpUIlS4u4nffGmyuw==
X-Google-Smtp-Source: ABdhPJwz/CLcFxBI/cvz+vNv1O1716R9EDbGS/lJN3cLLx8ZY3kiktxsKROfdKUg6qk8vtT+Kjkh2EnAzf/Kw34JXc8=
X-Received: by 2002:a2e:9e4e:: with SMTP id g14mr7718082ljk.261.1635120321725; 
 Sun, 24 Oct 2021 17:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-4-Mr.Bossman075@gmail.com>
In-Reply-To: <20211024154027.1479261-4-Mr.Bossman075@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Oct 2021 02:05:10 +0200
Message-ID: <CACRpkdZGAfJATC5MGaJ9AUs8x+nN_rDRATyV44Fkztoat4-ZLw@mail.gmail.com>
Subject: Re: [PATCH 03/13] dt-bindings: imx: Add pinctrl binding doc for
 i.MXRT1050
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Stefan Agner <stefan@agner.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 Russell King <linux@armlinux.org.uk>, 
 Abel Vesa <abel.vesa@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Jiri Slaby <jirislaby@kernel.org>, giulio.benetti@benettiengineering.com, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
 Leonard Crestez <leonard.crestez@nxp.com>,
 Huang Yongcai-B20788 <b20788@freescale.com>, 
 Andy Duan <fugang.duan@nxp.com>, linux-clk <linux-clk@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_170523_450048_55EFF9AF 
X-CRM114-Status: GOOD (  12.65  )
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
Message-ID: <20211025000510.3sIG5PQZf3Q0JfhMtEsU4sc8HmhOaoJ0u7JNfwaRMZU@z>

On Sun, Oct 24, 2021 at 5:40 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>
> Add binding doc for i.MXRT1050 pinctrl driver.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

On this and all the pinctrl stuff I need review from the current
Freescale maintainers, the fsl,pins stuff is a Freescale pecularity.
I would hardcode all of this into the driver but there are historical
reason for why Freescale want it and does it this way.
(And I don't understand those.)

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
