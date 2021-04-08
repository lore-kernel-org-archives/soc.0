Return-Path: <SRS0=yE/H=JF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB32C433ED
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Apr 2021 15:25:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FFAB610FB
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Apr 2021 15:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FFAB610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RpzJPjJJM1T0EHogTlN1pDD/r9xwmtKn0HHxGWCfg1U=; b=oDrnLuGLqgoOiMj39Qmiu/NTT
	1e0UD7Y6hNLE7IDwDgOH5Hd9g2b7t+Y6TwXl64BMyo6D82ZfN9eMm466fttK5TfQskhRTD7QbLk6d
	kIYR3nSeSz5In0UsNEVQjrHSPENybeF6D9uCJ5XT50ekTrhzPuI9B4DreaHMuEgJQwc1W9wOYbm9v
	6byrD8YrF2+2E9Kv22gPEYMlgZKeS1Glh5T5E9NA4PG6C3EBoEgmx0pEL2b2ubS1DOM0eK1TAaZUZ
	PY6IR86tsUu4kfpdN3UFj2tVUNwG1WOUClLN4QiSLPrdTFSH60G17sxZqERZWK92TpKqG3SbO/doY
	A3P4AiCbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUWWz-008NU2-W7; Thu, 08 Apr 2021 15:25:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUWWY-008NOP-Kg; Thu, 08 Apr 2021 15:24:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CD0361131;
 Thu,  8 Apr 2021 15:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617895489;
 bh=VaruDXNR2WSLO5GFXhTjUUOYioI0qkphMDyuPoQPY50=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BtykaJwyAvx6hT5d3xmhrfujVd0OnN7R2Icnu23yU8dH0IQG11y5kqMc5vap/mNSI
 YcgPlT7z1Ud00AdUW+h1As0obXX3yzGBk/Thy6tpANU4rnFFQBkqEmWx/q1HwluT3K
 O60Sdk8vnJ+qPoO299TbXi4WY1Bx8WZ2kWxLXi/q3PgOE8LxHvLNDnZqwkzRR+0j2I
 S2968Du9P0QNdEbkcfjFI1Xtr65GkCkrIqbbNgRktW6ioh5NggBosFbH1A9hZ96YvY
 qkk682cjb3baSlDPkzjL/nh0yMH1lMjtDhCHV5FHriZGPXZSKe9xz07n30jSd0Rt6a
 krcYIGwQ7dduw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.13
Date: Thu,  8 Apr 2021 17:24:22 +0200
Message-ID: <161789493793.1630479.15784072871445378505.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7h5z10mjpp.fsf@baylibre.com>
References: <7h5z10mjpp.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_162451_015231_355D7624 
X-CRM114-Status: UNSURE (   6.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210408152422.v62M6JblYVs2GtzBQnGHIx6DYGuIAmkBLKMAjd67hXk@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 05 Apr 2021 15:48:18 -0700, Kevin Hilman wrote:
> The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
> 
>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64
> 
> [...]

Merged into arm/dt, thanks!

Can you have a look at these added warnings from 'make dtbs_check W=1'?

amlogic/meson-gxl-s905d-mecool-kii-pro.dts:31.19-42.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
amlogic/meson-gxl-s905d-mecool-kii-pro.dts:37.12-41.5: Warning (unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit name, but no reg or ranges property
amlogic/meson-gxm-mecool-kiii-pro.dts:36.19-47.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
amlogic/meson-gxm-mecool-kiii-pro.dts:42.12-46.5: Warning (unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit name, but no reg or ranges property
amlogic/meson-gxm-minix-neo-u9h.dts:42.19-53.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
amlogic/meson-gxm-minix-neo-u9h.dts:48.12-52.5: Warning (unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit name, but no reg or ranges property
amlogic/meson-gxl-s805x-p241.dt.yaml: serial@84c0: 'uart-has-rtscts' does not match any of the regexes: 'pinctrl-[0-9]+' amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: audio-controller@5400:
'sound-name-prefix' does not match any of the regexes: 'pinctrl-[0-9]+' amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml:
audio-controller@c8832000: 'AVDD-supply', 'sound-name-prefix' do not match any f the regexes: 'pinctrl-[0-9]+'
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: bluetooth: clock-names: ['lpo'] is too short
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: bluetooth: clock-names:0: 'txco' was expected
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: bluetooth: clocks: [[23]] is too short
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: bus@c8834000: eth-phy-mux: {'type': 'object'} is not allowed for {'compatible': ['mdio-mux-mmioreg', 'mdio-mux'], '#address-cells': [[1]], '#size-cells': [[0]], 'reg': [[0, 1372, 0, 4]], 'mux-mask': [[4294967295]], 'mdio-parent-bus': [[35]], 'mdio@e40908ff': {'reg': [[3825797375]], '#address-cells': [[1]], '#size-cells': [[0]], 'ethernet-phy@8': {'compatible': ['ethernet-phy-id0181.4400'], 'interrupts': [[0, 9, 4]], 'reg': [[8]], 'max-speed': [[100]], 'phandle': [[36]]}}, 'mdio@2009087f': {'reg': [[537462911]], '#address-cells': [[1]], '#size-cells': [[0]]}}
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: bus@c8834000: rng: {'type': 'object'} is not allowed for {'compatible': ['amlogic,meson-rng'], 'reg': [[0, 0, 0, 4]], 'clocks': [[3, 25]], 'clock-names': ['core']}
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: hdmi-tx@c883a000: 'sound-name-prefix' does not match any of the regexes: pinctrl-[0-9]+'
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: ir@580: linux,rc-map-name:0: 'rc-mecool-kii-pro' is not one of ['rc-adstech-dvb-t-ci', 'rc-alink-dtu-m', 'rc-anysee', 'rc-apac-viewcomp',..., 'rc-zx-irdec']
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: serial@84c0: 'bluetooth', 'uart-has-rtscts' do not match any of the regexes:
'pinctrl-0-9]+'
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' do not atch any of the regexes: '^dai-link-[0-9]+$', 'pinctrl-[0-9]+'
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: audio-routing: ['AU2 INL', 'ACODEC LOLP', 'AU2 INR', 'ACODEC LORP', AU2 INL', 'ACODEC LOLN', 'AU2 INR', 'ACODEC LORN', 'Lineout', 'AU2 OUTL', 'Lineout', 'AU2 OUTR'] is too long
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: dai-link-0:sound-dai:0: [63, 0, 0] is too long
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: dai-link-0:sound-dai:0:1: missing phandle tag in 0
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: dai-link-0:sound-dai:0:2: missing phandle tag in 0
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: dai-link-1:sound-dai:0: [63, 0, 1] is too long
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: dai-link-1:sound-dai:0:1: missing phandle tag in 0
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: dai-link-1:sound-dai:0:2: missing phandle tag in 1
amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: vpu@d0100000: 'amlogic,canvas' does not match any of the regexes: 'pinctrl-[0-9]+'

merge commit: aa1e345ade42ba90ab868750acab27a360998af1

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
