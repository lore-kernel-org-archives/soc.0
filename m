Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3248C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:10:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A680610F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A680610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rz6W4nQWc+w51fe2BqIIzamv+REbwAwjT3uxgV/MG6w=; b=mKewZoLNFv/lna1gcSYrS4fC56
	u43Jm3o+Qm96fpGS3NHZVj0r6CKylDTJkw7CzYunQO8m7JoYC0gG43iavqfV1AcZkl3aHr4QlKqdz
	QoCY2nDUqHZN4iYp9QYYfb/9KMw/wvlFrTBHmugzFDbjAFE4d8jqglyRLz4nRgc8DJFE1MjY9q6za
	B49kaF4HS1osH5pJ0hPkJh22AF5gyK/C4Kn3uEdmM6JUoZsRGyc5thnQDwbnyo920QML9yOUAE9XK
	/doUPo8vSaidLifkqWwdwBYne2L78FFyu+m4cu/X2LE/UM2jH6s+EyBo5e9Kc10so8bwe7KlNG5kx
	LMqnvpUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUWH8-008KhX-IX; Thu, 08 Apr 2021 15:08:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUWH3-008Kg1-Jg
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 15:08:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4687D6113D
 for <linux-arm-kernel@lists.infradead.org>;
 Thu,  8 Apr 2021 15:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617894526;
 bh=mptieGlcKPU5KskFHWeGl9cVgQCk/7gZiC+o4YWCN04=;
 h=From:Date:Subject:To:List-Id:Cc:From;
 b=math1jz1aOcUsliiVGe7ybzDeNQx8ZQOg/u9LBSmh+44Eug/j7qsb5ATbZeT6WCuY
 zzCSXyqzT7N18aS3pHXtLDJx15XngVigElo30/1bGzjVXAHVtwlVznOp1D7/6kipEM
 yrKa80G10KoiKKl70eHawrAW+DqNw8dsmo7FhM3u/fgDMqRSaRVVgO900bO58CL59V
 sxTLHWJt475y+yuuhsWEg2Yk4m7I42Rn08oO9oNATddcGSuUDiSXn+SblS6J5AiKwa
 p7OORePTDP/vaC3sw2s3EIN8cuUpt+NnkxYEhNj3JkM5wvgzGGzr1bn0V9yJiPYdwJ
 sNIj/bnrXXt4A==
Received: by mail-oo1-f46.google.com with SMTP id
 h3-20020a4ae8c30000b02901b68b39e2d3so576969ooe.9
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 08 Apr 2021 08:08:46 -0700 (PDT)
X-Gm-Message-State: AOAM532dBoLKUPOxuDzmKHtfJEdHG+inSs0UG4/h6+yqZRnPg/Eg/twO
 FaIHH307nR0hZiC5FpT401ErEtZbBwPRAj1FnX4=
X-Google-Smtp-Source: ABdhPJw+7hjoinGgMKHtOjHzXWCJbcM/Qjm5kvSsMGgB+p60HH19Y1PuShQDqjV0rsKON27NwZiCRgaANX1zPSDoX7Y=
X-Received: by 2002:a4a:244d:: with SMTP id v13mr7994985oov.66.1617894525470; 
 Thu, 08 Apr 2021 08:08:45 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 8 Apr 2021 17:08:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
Message-ID: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
Subject: New 'make dtbs_check W=1' warnings
To: DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Alexandre Torgue <alexandre.torgue@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tony Lindgren <tony@atomide.com>, 
 Shawn Guo <shawnguo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 SoC Team <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>, 
 Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_160850_008293_1F4E5DE7 
X-CRM114-Status: GOOD (  14.02  )
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
Message-ID: <20210408150826.Sb1EXfUi8yKvzGuvNqyYKzIwCr-Dkx9VJj9jfxNe_jg@z>

Greetings to all Arm platform maintainers,

I've just gone through the DT merges I've received so far and, with a
little help from Rob,
managed to run 'make dtbs_check W=1' before and after, to see what
warnings we get.
The good news is that the number of warnings is going down, but
unfortunately there
is still an unmanageable amount of remaining warnings, and some new
ones crept in.

I'm still working on my tooling for this, to catch these better, but
ideally I think we should
try to not introduce new warnings. I think some platforms are already
clean, and I did
not see any new warnings for mvebu, samsung and broadcom. There were a lot of
warnings from .dtsi files, and I probably did an incomplete job at
deduplicating those.

See below for the other platforms, and the new warnings that I found.
If these are
valid, please send a fixup before the merge window, and let me know if
you have ideas
for how we should handle these in the future.

For this merge window, I don't think any of them are show-stoppers (Rob, let me
know if you disagree), but in the long run we may want to gradually enforce
a rule about not merging changes that introduce any new warnings, in order to
have a chance of cleaning up the existing ones.

       Arnd

arch/arm/boot/dts/ste-href520-tvk.dt.yaml: accelerometer@19:
interrupts: [[18, 1], [19, 1]] is too long
arch/arm/boot/dts/ste-hrefprev60-tvk.dt.yaml: gyroscope@68:
interrupts-extended: [[22, 0, 1], [21, 31, 1]] is too long
arch/arm/boot/dts/ste-hrefv60plus-tvk.dt.yaml: gyroscope@68:
interrupts-extended: [[25, 0, 1], [24, 31, 1]] is too long
arch/arm/boot/dts/ste-hrefv60plus-tvk.dt.yaml: accelerometer@1c:
interrupts: [[18, 1], [19, 1]] is too long

arch/arm/boot/dts/omap5-cm-t54.dt.yaml: gpmc@50000000: 'clocks' is a
dependency of 'clock-names'
arch/arm/boot/dts/omap5-igep0050.dt.yaml: gpmc@50000000: 'clocks' is a
dependency of 'clock-names'
arch/arm/boot/dts/omap5-sbc-t54.dt.yaml: gpmc@50000000: 'clocks' is a
dependency of 'clock-names'
arch/arm/boot/dts/omap5-uevm.dt.yaml: gpmc@50000000: 'clocks' is a
dependency of 'clock-names'

arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dt.yaml:
pin-controller@50002000: 'ltdc' does not match any of the regexes:
'-[0-9]*$', '^gpio@[0-9a-f]*$', 'pinctrl-[0-9]+'

arch/arm/boot/dts/at91-sama5d2_ptc_ek.dt.yaml: /: 'etm@73C000' does
not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$',
'pinctrl-[0-9]+'
arch/arm/boot/dts/at91-kizbox3-hs.dt.yaml: /: 'etm@73C000' does not
match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$',
'pinctrl-[0-9]+'

amlogic/meson-gxl-s905d-mecool-kii-pro.dts:31.19-42.4: Warning
(avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary
#address-cells/#size-cells without "ranges" or child "reg" property
amlogic/meson-gxl-s905d-mecool-kii-pro.dts:37.12-41.5: Warning
(unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit
name, but no reg or ranges property
amlogic/meson-gxm-mecool-kiii-pro.dts:36.19-47.4: Warning
(avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary
#address-cells/#size-cells without "ranges" or child "reg" property
amlogic/meson-gxm-mecool-kiii-pro.dts:42.12-46.5: Warning
(unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit
name, but no reg or ranges property
amlogic/meson-gxm-minix-neo-u9h.dts:42.19-53.4: Warning
(avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary
#address-cells/#size-cells without "ranges" or child "reg" property
amlogic/meson-gxm-minix-neo-u9h.dts:48.12-52.5: Warning
(unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit
name, but no reg or ranges property
amlogic/meson-gxl-s805x-p241.dt.yaml: serial@84c0: 'uart-has-rtscts'
does not match any of the regexes: 'pinctrl-[0-9]+'
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: audio-controller@5400:
'sound-name-prefix' does not match any of the regexes:
'pinctrl-[0-9]+'
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml:
audio-controller@c8832000: 'AVDD-supply', 'sound-name-prefix' do not
match any f the regexes: 'pinctrl-[0-9]+'
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: bluetooth:
clock-names: ['lpo'] is too short
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: bluetooth:
clock-names:0: 'txco' was expected
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: bluetooth: clocks:
[[23]] is too short
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: bus@c8834000:
eth-phy-mux: {'type': 'object'} is not allowed for {'compatible':
['mdio-mux-mmioreg', 'mdio-mux'], '#address-cells': [[1]],
'#size-cells': [[0]], 'reg': [[0, 1372, 0, 4]], 'mux-mask':
[[4294967295]], 'mdio-parent-bus': [[35]], 'mdio@e40908ff': {'reg':
[[3825797375]], '#address-cells': [[1]], '#size-cells': [[0]],
'ethernet-phy@8': {'compatible': ['ethernet-phy-id0181.4400'],
'interrupts': [[0, 9, 4]], 'reg': [[8]], 'max-speed': [[100]],
'phandle': [[36]]}}, 'mdio@2009087f': {'reg': [[537462911]],
'#address-cells': [[1]], '#size-cells': [[0]]}}
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: bus@c8834000: rng:
{'type': 'object'} is not allowed for {'compatible':
['amlogic,meson-rng'], 'reg': [[0, 0, 0, 4]], 'clocks': [[3, 25]],
'clock-names': ['core']}
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: hdmi-tx@c883a000:
'sound-name-prefix' does not match any of the regexes: pinctrl-[0-9]+'
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: ir@580:
linux,rc-map-name:0: 'rc-mecool-kii-pro' is not one of
['rc-adstech-dvb-t-ci', 'rc-alink-dtu-m', 'rc-anysee',
'rc-apac-viewcomp',..., 'rc-zx-irdec']
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: leds: 'blue' does not
match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: serial@84c0:
'bluetooth', 'uart-has-rtscts' do not match any of the regexes:
'pinctrl-0-9]+'
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound:
'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' do
not atch any of the regexes: '^dai-link-[0-9]+$', 'pinctrl-[0-9]+'
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: 'clocks' is a
dependency of 'assigned-clocks'
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: audio-routing:
['AU2 INL', 'ACODEC LOLP', 'AU2 INR', 'ACODEC LORP', AU2 INL', 'ACODEC
LOLN', 'AU2 INR', 'ACODEC LORN', 'Lineout', 'AU2 OUTL', 'Lineout',
'AU2 OUTR'] is too long
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound:
dai-link-0:sound-dai:0: [63, 0, 0] is too long
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound:
dai-link-0:sound-dai:0:1: missing phandle tag in 0
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound:
dai-link-0:sound-dai:0:2: missing phandle tag in 0
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound:
dai-link-1:sound-dai:0: [63, 0, 1] is too long
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound:
dai-link-1:sound-dai:0:1: missing phandle tag in 0
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound:
dai-link-1:sound-dai:0:2: missing phandle tag in 1
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: vpu@d0100000:
'amlogic,canvas' does not match any of the regexes: 'pinctrl-[0-9]+'

freescale/imx8-ss-audio.dtsi:16.33-21.4: Warning (simple_bus_reg):
/bus@59000000/clock-audio-ipg: missing or empty reg/ranges property
freescale/imx8-ss-conn.dtsi:16.31-21.4: Warning (simple_bus_reg):
/bus@5b000000/clock-conn-axi: missing or empty reg/ranges property
freescale/imx8-ss-conn.dtsi:23.31-28.4: Warning (simple_bus_reg):
/bus@5b000000/clock-conn-ahb: missing or empty reg/ranges property
freescale/imx8-ss-conn.dtsi:30.31-35.4: Warning (simple_bus_reg):
/bus@5b000000/clock-conn-ipg: missing or empty reg/ranges property
freescale/imx8-ss-dma.dtsi:16.29-21.4: Warning (simple_bus_reg):
/bus@5a000000/clock-dma-ipg: missing or empty reg/ranges property
freescale/imx8-ss-lsio.dtsi:16.31-21.4: Warning (simple_bus_reg):
/bus@5d000000/clock-lsio-mem: missing or empty reg/ranges property
freescale/imx8-ss-lsio.dtsi:23.31-28.4: Warning (simple_bus_reg):
/bus@5d000000/clock-lsio-bus: missing or empty reg/ranges property
freescale/fsl-lx2160a-clearfog-cx.dt.yaml: ethernet@7: 'sfp' does not
match any of the regexes: 'pinctrl-[0-9]+'
freescale/fsl-lx2160a-clearfog-cx.dt.yaml: ethernet@8: 'sfp' does not
match any of the regexes: 'pinctrl-[0-9]+'
freescale/fsl-lx2160a-clearfog-cx.dt.yaml: ethernet@9: 'sfp' does not
match any of the regexes: 'pinctrl-[0-9]+'
freescale/fsl-lx2160a-clearfog-cx.dt.yaml: ethernet@a: 'sfp' does not
match any of the regexes: 'pinctrl-[0-9]+'
freescale/fsl-lx2160a-honeycomb.dt.yaml: power-controller@1e34040:
'#power-domain-cells' is a required property

mediatek/mt8183-pumpkin.dts:35.36-39.5: Warning (unit_address_vs_reg):
/reserved-memory/scp_mem_region: node has a reg or ranges property,
but no unit name
mediatek/mt8183-pumpkin.dts:58.8-64.4: Warning (unit_address_vs_reg):
/ntc@0: node has a unit name, but no reg or ranges property
mediatek/mt8183.dtsi:1106.26-1112.6: Warning (unit_address_format):
/soc/t-phy@11f40000/usb-phy@0700: unit name should not have leading 0s
mediatek/mt8183.dtsi:1234.22-1246.5: Warning
(avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary
#address-cells/#size-cells without "ranges" or child "reg" property
mediatek/mt8183.dtsi:676.17-795.5: Warning (simple_bus_reg):
/soc/thermal-zones: missing or empty reg/ranges property
mediatek/mt8183.dtsi:684.30-688.8: Warning (unit_address_vs_reg):
/soc/thermal-zones/cpu_thermal/trips/trip-point@0: node has a unit
name, but no reg or ranges property
mediatek/mt8183-evb.dt.yaml: soc: thermal-zones: {'type': 'object'} is
not allowed for {'cpu_thermal': {'polling-delay-passive': [[100]],
'polling-delay': [[500]], 'thermal-sensors': [[41, 0]...
'pinctrl-[0-9]+'
mediatek/mt8183-kukui-jacuzzi-damu.dt.yaml: anx7625@58:
'#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do
not match any of the regexes: 'pinctrl-[0-9]+'
mediatek/mt8183-kukui-jacuzzi-damu.dt.yaml: anx7625@58: 'ports' is a
required property
mediatek/mt8183-kukui-jacuzzi-damu.dt.yaml: cros_ec: 'mtk,rpmsg-name'
does not match any of the regexes: '^#.*', ...

qcom/sc7180.dtsi:1204.21-1220.6: Warning
(avoid_unnecessary_addr_size): /soc@0/geniqup@ac0000/i2c@a8c000:
unnecessary #address-cells/#size-cells without "ranges" or child "reg"
property
qcom/sc7180.dtsi:965.21-981.6: Warning (avoid_unnecessary_addr_size):
/soc@0/geniqup@8c0000/i2c@890000: unnecessary
#address-cells/#size-cells without "ranges" or child "reg" property
qcom/sdm845.dtsi:3912.23-4045.5: Warning (simple_bus_reg):
/soc@0/camss@a00000: simple-bus unit address format error, expected
"acb3000"
qcom/sdm845.dtsi:4041.10-4044.6: Warning (graph_child_address):
/soc@0/camss@a00000/ports: graph node has single child node 'port@0',
#address-cells/#size-cells are not necessary
qcom/sdm845.dtsi:4102.32-4129.5: Warning (simple_bus_reg):
/soc@0/dsi-opp-table: missing or empty reg/ranges property
ti/k3-am64-main.dtsi:376.40-385.4: Warning (simple_bus_reg):
/bus@f4000/interrupt-controller0: missing or empty reg/ranges property
ti/k3-am64-main.dtsi:45.13-135.4: Warning (simple_bus_reg):
/bus@f4000/dmss: missing or empty reg/ranges property
ti/k3-am64-mcu.dtsi:77.39-86.4: Warning (simple_bus_reg):
/bus@f4000/bus@4000000/interrupt-controller1: missing or empty
reg/ranges property
qcom/msm8916-samsung-a5u-eur.dt.yaml: spmi@200f000: reg: [[33615872,
4096], [37748736, 4194304], [46137344, 4194304], [58720256, 2097152],
[33595392, 8448]] is too long
qcom/sc7180-trogdor-lazor-r0.dt.yaml: gmu@506a000: compatible:0:
'qcom,adreno-gmu-618.0' is not one of ['qcom,adreno-gmu-630.2']
qcom/sc7180-trogdor-lazor-r1-kb.dt.yaml: memory@80900000:
'device_type' is a required property
qcom/sdm850-lenovo-yoga-c630.dt.yaml: memory@97b00000: 'device_type'
is a required property

renesas/r8a774a1-beacon-rzg2m-kit.dt.yaml: csi2@feaa0000: ports:
'port@0' is a required property
renesas/r8a779a0-falcon.dt.yaml: thermal-zones: 'sensor-thermal1',
'sensor-thermal2', 'sensor-thermal3', 'sensor-thermal4',
'sensor-thermal5' do not match any of the regexes:
'^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
renesas/r8a779a0-falcon.dt.yaml: timer@e61e0000: compatible:0:
'renesas,tmu-r8a779a0' is not one of ['renesas,tmu-r8a7740',
'renesas,tmu-r8a774a1', 'renesas,tmu-r8a774b1',
'renesas,tmu-r8a774c0', 'renesas,tmu-r8a774e1', 'renesas,tmu-r8a7778',
'renesas,tmu-r8a7779', 'renesas,tmu-r8a7795', 'renesas,tmu-r8a7796',
'renesas,tmu-r8a77961', 'renesas,tmu-r8a77965',
'renesas,tmu-r8a77970', 'renesas,tmu-r8a77980',
'renesas,tmu-r8a77990', 'renesas,tmu-r8a77995']

rockchip/rk3399-khadas-edge-v.dt.yaml: usb@fe800000:
#address-cells:0:0: 1 was expected

ti/k3-am642-evm.dt.yaml: bus@4000000: interrupt-controller1: {'type':
'object'} is not allowed for {'compatible': ['ti,sci-intr'],
'ti,intr-trigger-type': [[1]], 'interrupt-controller': True,
'interrupt-parent': [[1]], '#interrupt-cells': [[1]], 'ti,sci': [[4]],
'ti,sci-dev-id': [[5]], 'ti,interrupt-ranges': [[0, 104, 4]],
'phandle': [[5]]}
ti/k3-am642-evm.dt.yaml: bus@f4000: dmss: {'type': 'object'} is not
allowed for {'compatible': ['simple-mfd'], '#address-cells': [[2]],
'#size-cells': [[2]], 'dma-ranges': True, 'ranges':  'phandle':
[[7]]}}
ti/k3-am642-evm.dt.yaml: bus@f4000: interrupt-controller0: {'type':
'object'} is not allowed for {'compatible': ['ti,sci-intr'],
'ti,intr-trigger-type': [[1]], 'interrupt-controller': True,
'interrupt-parent': [[1]], '#interrupt-cells': [[1]], 'ti,sci': [[4]],
'ti,sci-dev-id': [[3]], 'ti,interrupt-ranges': [[0, 32, 16]],
'phandle': [[15]]}
ti/k3-am642-evm.dt.yaml: flash@0: 'cdns,read-delay', 'cdns,tchsh-ns',
'cdns,tsd2d-ns', 'cdns,tshsl-ns', 'cdns,tslch-ns' do not match any of
the regexes: '^partition@', 'pinctrl-[0-9]+'
ti/k3-am642-sk.dt.yaml: bus@4000000: interrupt-controller1: {'type':
'object'} is not allowed for {'compatible': ['ti,sci-intr'],
'ti,intr-trigger-type': [[1]], ...
ti/k3-am642-sk.dt.yaml: bus@f4000: dmss: {'type': 'object'} is not
allowed for {'compatible': ['simple-mfd'], ...
ti/k3-am642-sk.dt.yaml: bus@f4000: interrupt-controller0: {'type':
'object'} is not allowed for {'compatible': ['ti,sci-intr'],
'ti,intr-trigger-type': [[1]], 'interrupt-controller': True,
'interrupt-parent': [[1]], '#interrupt-cells': [[1]], 'ti,sci': [[4]],
'ti,sci-dev-id': [[3]], 'ti,interrupt-ranges': [[0, 32, 16]],
'phandle': [[11]]}
ti/k3-am642-sk.dt.yaml: flash@0: 'cdns,read-delay', 'cdns,tchsh-ns',
'cdns,tsd2d-ns', 'cdns,tshsl-ns', 'cdns,tslch-ns' do not match any of
the regexes: '^partition@', 'pinctrl-[0-9]+'
ti/k3-j7200-common-proc-board.dt.yaml: flash@0: 'cdns,read-delay',
'cdns,tchsh-ns', 'cdns,tsd2d-ns', 'cdns,tshsl-ns', 'cdns,tslch-ns' do
not match any of the regexes: '^partition@', 'pinctrl-[0-9]+'

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
