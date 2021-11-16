Return-Path: <SRS0=vwZw=QD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E8EC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Nov 2021 03:09:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3DFF60E78
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Nov 2021 03:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3DFF60E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xwAru/NWEzmpPJPHLBbz7T49g4lQg5lMNopwCkI1Gis=; b=ufO+a6LEvwKKOI
	IQP78d6zesdo8bkvCrGViUsNLO7yD6sKsuNmVYfpkuFrs9gc+fPnJVxeiY+U0x8ACOcLE9fKpFmgM
	doaL58JCFUIfBUXYv/wLyEXsko5CSFGtzls17htKmLJEMq1amA0erfSbdWNgFjgTytwDMhGpDthjx
	HDem2gje/ZSwtOR7PEXu85jDFZ44SFJlCiz5Slu7uEP+Rz50uy7xw5XgGKr4Jjzj6eYqgC8ESpUMM
	PJql78YXv1ft2CTftKrO8oAjOa8kdj5hFZipDLGNRByHPFPlfi4CUXN/BJ6vEimRRwr/EYzinUgCD
	Cb5CHaZ7UwnzC0YweLTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmopI-000CSS-VL; Tue, 16 Nov 2021 03:08:05 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmopF-000CS5-4I
 for linux-arm-kernel@lists.infradead.org; Tue, 16 Nov 2021 03:08:02 +0000
Received: by mail-qv1-xf29.google.com with SMTP id b11so12786004qvm.7
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 15 Nov 2021 19:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p+3tuhUNj0IibcDWormquB6v06wUV9mYHE56GduUS2M=;
 b=HX+WlerYmiz45dfnhbTRz6BP49luNrI3xPfvXAYTA5J893Cp1bgpgD2R5O7ilpXhW2
 Ztmg7mlqRhJkIkuQm++MMxicg1qvpkbTGvPIau+qkbupjPVIfVYoLwIHU9tvFf/5pFBG
 WgEPgLF0Bhivdt+M0+t9VJ0AkIctplBmfJFqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p+3tuhUNj0IibcDWormquB6v06wUV9mYHE56GduUS2M=;
 b=AwQaYRAZV/zBAk36X1oHvbZcaUt4k+WQqMoELSaofQQJvFxnFZfB1BUf7cQLe3rBpx
 IafnGexwuUouSd2PUB9A2lzP6Ll8Jq6pAs/BKgsXyq7ixhEdjI1KiLMJJvw4QtkyDdIY
 smqZdTCrYo0/kWA9ElX2+5I5j/M+xFMaUnLV4hR5JBRETdTRj0E/Q5XZMvnvznTlOZjL
 O4ibW5W7igNfKtOlD4ANCk2Hmi46icGyOzYFW5BWhqIEr+Pe/Zqjou2IMhqffg5m962q
 dThH8fu2kWQdMG4fmOAYKZ3RoelKJRQQLLoPI3eP3agIat3FeD/SNPXm0jiYi/GhWprK
 pJSw==
X-Gm-Message-State: AOAM530y9OHVyAKysuMrc6SiDnMUAsZIT203yM9FJntUTyj8MSAYPs4/
 V6IEX1b2irBaNZM+5Q15ZLtttO1MBxnBfK8W5+M=
X-Google-Smtp-Source: ABdhPJxVHar3OL/4LwNLEgzkuKc1H5RS71UlqygRtUVrY8OEkV+Kz3DE/kgpDDzrS8wn8JXdXAJ7KIukSIeqLNgOs0g=
X-Received: by 2002:a05:6214:e41:: with SMTP id
 o1mr42634802qvc.43.1637032080033; 
 Mon, 15 Nov 2021 19:08:00 -0800 (PST)
MIME-Version: 1.0
References: <20211110062656.3041994-1-howard.chiu@quantatw.com>
In-Reply-To: <20211110062656.3041994-1-howard.chiu@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Nov 2021 03:07:48 +0000
Message-ID: <CACPK8Xc6wV4KbMAT_ekyMTTbfNqx2ox_d7mEFGVT4OvBDDadBQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Adding Facebook Bletchley BMC
To: Howard Chiu <howard10703049@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
 Howard Chiu <howard.chiu@quantatw.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_190801_194835_040B1A0D 
X-CRM114-Status: GOOD (  14.78  )
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
Message-ID: <20211116030748.jRbmm_LRUTFVWMdBy-WUBGuo0BWo0sxTUyzGZIRIX4M@z>

Hi Howard,

On Wed, 10 Nov 2021 at 06:29, Howard Chiu <howard10703049@gmail.com> wrote:
>
> Initial introduction of Facebook Bletchley equipped with
> Aspeed 2600 BMC SoC.
>
> Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>
> ---

Please use this area to document the differences between versions of
your patch. Let us know what you've fixed, and what you've decided not
to change based on review.

> +&uart5 {
> +       // Workaround for A0
> +       compatible = "snps,dw-apb-uart";
> +};

Are you still using a0 boards?

> +
> +&i2c0 {
> +       status = "okay";
> +       /* TODO: Add HSC MP5023 */
> +       /* TODO: Add ADC INA230 */
> +
> +       tmp421@4f {
> +               compatible = "ti,tmp421";
> +               reg = <0x4f>;
> +       };
> +
> +       sled0_ioexp: pca9539@76 {
> +               compatible = "nxp,pca9539";
> +               reg = <0x76>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio-line-names =
> +               "","SLED0_BMC_CCG5_INT","SLED0_INA230_ALERT","SLED0_P12V_STBY_ALERT",
> +               "SLED0_SSD_ALERT","SLED0_MS_DETECT","SLED0_MD_REF_PWM","",
> +               "SLED0_MD_STBY_RESET","SLED0_MD_IOEXP_EN_FAULT","SLED0_MD_DIR","SLED0_MD_DECAY",
> +               "SLED0_MD_MODE1","SLED0_MD_MODE2","SLED0_MD_MODE3","SLED0_AC_PWR_EN";

I'll wait for Patrick's review on these. I would prefer you follow the
openbmc naming scheme that he mentioned in v1 of your patch.

> +
> +               gpio@0 {
> +                       reg = <0>;
> +               };

I think this is incorrect, you would need to specify:

type = <PCA955X_TYPE_GPIO>

However with this change, there's no need to specify the individual gpio nodes:

https://lore.kernel.org/all/20210921043936.468001-2-andrew@aj.id.au/


> +
> +&i2c4 {
> +       status = "okay";
> +       /* TODO: Add HSC MP5023 */
> +       /* TODO: Add ADC INA230 */
> +
> +       tmp421@4f {
> +               compatible = "ti,tmp421";
> +               reg = <0x4f>;
> +       };
> +
> +       sled4_ioexp: pca9539@76 {
> +               compatible = "nxp,pca9539";
> +               reg = <0x76>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio-line-names =
> +               "","SLED4_BMC_CCG5_INT","SLED4_INA230_ALERT","SLED4_P12V_STBY_ALERT",
> +               "SLED4_SSD_ALERT","SLED4_MS_DETECT","SLED4_MD_REF_PWM","",
> +               "SLED4_MD_STBY_RESET","SLED4_MD_IOEXP_EN_FAULT","SLED4_MD_DIR","SLED4_MD_DECAY",
> +               "SLED4_MD_MODE1","SLED4_MD_MODE2","SLED4_MD_MODE3","SLED4_AC_PWR_EN";

As Patrick mentioned, I think we want to have a convention for
multi-node machines in the GPIO naming.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
