Return-Path: <SRS0=YOEr=PV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA97C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:56:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1B8E60E0C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1B8E60E0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lzk26TIDiXoFQcXyCDVl/bxy3XgGliCST8SKxn1y2c8=; b=dH05fLkbPKGSyJ
	SGoYqzpO9+rQW8N4H9+XRK2twBj7Kzkc/n6uBeD1ngjj2/S6px8Qg9HNHpvriCF61ZG4LnvaDOoVK
	Lzz21ToDFao5UHbWSJfL5xuRsMNHeJxfR90qEwGz/50FOA22Zeui/djuV+IS5BbmXHyBY7HtgWVzK
	+taBh4bs3E8gynCkoF0kCwuSFlxNmFTimoDbaXqLnecKRtOA2wjst1aqIsvxB/ARGv7XHd+zJAHCX
	Z0EWekYiR/kQGbRpFJuh2H20m444sED1ROH633FbhrNabGADFkygWb8mnUZKjJ9AKlKjoJaJFeoff
	oKQARQkxIBh3TgzlcwNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi3c0-003UrY-Jk; Tue, 02 Nov 2021 23:54:40 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi3bw-003Upn-7D
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Nov 2021 23:54:37 +0000
Received: by mail-qk1-x72e.google.com with SMTP id bm28so680491qkb.9
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 16:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LUJiTUBUz+nDDvCf1YrbjU2s+1FnYiIkeo+EME3kWwE=;
 b=BNApYS/cqy5Q8pdJ6jerjEhOsDIbqWdYf8uPLunlFYkDoZhIBYDV7KLx9u1GGpwkbx
 VDeMVUv2ZWvR9TRrck38B+vOyhfL9gTBUy629STDqNUMp1uGHHayoc7tZXW8D6YU6To9
 kUvOO+J/uKtfxlmdUxI+rWQFwuy7C+ika/nna4YYGHKvLgLcTPbT6GxAQLPmCbwaoUg1
 6fyU5H9l69w0bBtEA1OhYyxBIrSSOoXKjB1V27h1u8Cykxgs0k6m2y8CLpIlhK1dFLW4
 tSNxarNGJIzfTiMXyL/IoiAOFpa+k+W9VH7iCSucuZNt0iM7bA1bkFYZdkr7zuLJGx5t
 FSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LUJiTUBUz+nDDvCf1YrbjU2s+1FnYiIkeo+EME3kWwE=;
 b=nafrG7tlgS19EnAG8WcsQeFmpvAjwb8COvN1CrBdiL0YYVKh6PVvu7/zPsUuDVvVwJ
 U3RAiNnSpyG/eJEAbHReyB0fh/+LVcHfx4SYMO6N0mbbUiiUtqH2uOVKJzea6sjn1rbE
 1AFLu7sIlBmbznuonSmqLdep6Myd7C1ddVZBM0PuOH1rp5Dm6R+8g0Tg7lceYSPb774a
 UX9BmAR7/vlN/IdjXNZd5lOHUUZcylk/+nrD7U5P7D5dHMFUMbjwyCFAqhYFKqeiiocF
 uyORUTYBkbRlYtnGDE+KkZhcBy6ZDL7HtKuDZ1z//PVsk2RKfgO2tGMRv00b+gXy0BrI
 Jjdw==
X-Gm-Message-State: AOAM530ITzzbK8oOC4rBwI6Q94XHml43EwayAo7hcc/AsgqG9Rdmevkz
 Xp5OrUrSFtQsg6jtBwJkRi4=
X-Google-Smtp-Source: ABdhPJzxro4hWmMP7y5iTOVWvZMs+GGc/IGEN1fn/TBo+Ziw7KfVlQyzMaZ6cwWeXs/C99ERXXqZjA==
X-Received: by 2002:a05:620a:4150:: with SMTP id
 k16mr16278131qko.186.1635897275437; 
 Tue, 02 Nov 2021 16:54:35 -0700 (PDT)
Received: from [10.4.10.38]
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id w1sm382768qtj.28.2021.11.02.16.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 16:54:35 -0700 (PDT)
Message-ID: <e2f81ad7-9c58-3e39-fbb0-5ef3132bba7d@gmail.com>
Date: Tue, 2 Nov 2021 19:54:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 12/13] ARM: dts: imx: add i.MXRT1050-EVK support
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sascha Hauer <kernel@pengutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, Stefan Agner <stefan@agner.ch>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Abel Vesa <abel.vesa@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-serial@vger.kernel.org
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-13-Mr.Bossman075@gmail.com>
 <CAOMZO5DV-6dKnaGMgARhtv7mq-nOr9jO-XUWAJDmJWwNxc+B1g@mail.gmail.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <CAOMZO5DV-6dKnaGMgARhtv7mq-nOr9jO-XUWAJDmJWwNxc+B1g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_165436_298973_BCA26899 
X-CRM114-Status: GOOD (  23.36  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211102235433.3JfcTCHyv8KFLQN4YGcEedrcVtZDP7FWaUczB2bKTpI@z>



On 11/2/21 19:42, Fabio Estevam wrote:
> On Tue, Nov 2, 2021 at 7:57 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
> 
>> +/ {
>> +       model = "NXP IMXRT1050-evk board";
>> +       compatible = "fsl,imxrt1050-evk", "fsl,imxrt1050";
>> +
>> +       chosen {
>> +               bootargs = "root=/dev/ram";
> 
> No need to pass bootargs here.
> 
>> +               stdout-path = &lpuart1;
>> +       };
>> +
>> +       aliases {
>> +               gpio0 = &gpio1;
>> +               gpio1 = &gpio2;
>> +               gpio2 = &gpio3;
>> +               gpio3 = &gpio4;
>> +               gpio4 = &gpio5;
>> +               mmc0 = &usdhc1;
>> +               serial0 = &lpuart1;
>> +       };
>> +
>> +       memory@0 {
> 
> memory@80000000
> 
> Building with W=1 should give a dtc warning due to the unit address
> and reg mismatch.
Oh that makes sense.
I guess I'm going to have to figure out how to get warnings to work as I 
couldn't last time I tried.
> 
>> +               device_type = "memory";
>> +               reg = <0x80000000 0x2000000>;
>> +       };
>> +
> 
> Unneeded blank line.
>> +
>> +&iomuxc {
>> +       pinctrl-names = "default";
>> +
>> +       imxrt1050-evk {
> 
> No need for this imxrt1050-evk container.
I was wondering if that was needed, u-boot has it, good to know.
> 
>> +               pinctrl_lpuart1: lpuart1grp {
>> +                       fsl,pins = <
>> +                               MXRT1050_IOMUXC_GPIO_AD_B0_12_LPUART1_TXD
>> +                                       0xf1
> 
> Put it on a single line. It helps readability. Same applies globally.
>> +&usdhc1 {
>> +       pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
>> +       pinctrl-0 = <&pinctrl_usdhc0>;
>> +       pinctrl-1 = <&pinctrl_usdhc0>;
>> +       pinctrl-2 = <&pinctrl_usdhc0>;
>> +       pinctrl-3 = <&pinctrl_usdhc0>;
>> +       status = "okay";
>> +
>> +       cd-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
> 
> Make 'status' to be the last property. Remove the blank line.
> 
>> +               edma1: dma-controller@400e8000 {
>> +                       #dma-cells = <2>;
>> +                       compatible = "fsl,imx7ulp-edma";
>> +                       reg = <0x400e8000 0x4000>,
>> +                               <0x400ec000 0x4000>;
>> +                       dma-channels = <32>;
>> +                       interrupts = <0>,
>> +                               <1>,
>> +                               <2>,
>> +                               <3>,
>> +                               <4>,
>> +                               <5>,
>> +                               <6>,
>> +                               <7>,
>> +                               <8>,
>> +                               <9>,
>> +                               <10>,
>> +                               <11>,
>> +                               <12>,
>> +                               <13>,
>> +                               <14>,
>> +                               <15>,
>> +                               <16>;
> 
> Please group more elements into the same line.
> 
> Putting one entry per line makes it extremely long.
> 
>> +               gpio5: gpio@400c0000 {
>> +                       compatible = "fsl,imxrt-gpio", "fsl,imx35-gpio";
>> +                       reg = <0x400c0000 0x4000>;
>> +                       interrupts = <88>,
>> +                               <89>;
> 
> Put the interrupts into a single line.
> 
Ah all these make sense, will fix, sry about that.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
