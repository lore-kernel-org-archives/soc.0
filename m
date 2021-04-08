Return-Path: <SRS0=+Itf=JG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD26C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 00:01:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C68761057
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 00:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C68761057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xqA94HJ2sTxADaJPIr+nG7CB0X9BhjJmf0S5IvKtxUc=; b=HVxMnpfQmT8xCfoHwx6/VdlK1
	vc9/YiSICzSUTzPdSWWw2JLQJe040AdIlJ5Z5fp6lrCSMKdu8zRQIgB/WrqyCKV3L52pWRIa5w0b0
	gCkug0hT0JAOItSDyMYm+3z/Ayn6200LYaXvXZ0Wm5liXAKP+0bUf6NgH4MZW3Q4ID38ieuB3STF/
	DMQ3ykP5JlHzpboHBF/p28aJuVs59ar+nEpzwpuyFUZkh0UbFQea3yY6CJ2ao6dMkx6I8Tvt7Lzj1
	V+nC0/YZXND0K+4TDtQg1jn7yGAI6cdjNJhIH42goG0fpC6YS5l/lep93Qcl2O2MkQYhuyCC4S55Y
	+JIEqBzag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUeZJ-009WWs-1f; Fri, 09 Apr 2021 00:00:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUeZB-009WVS-Pd
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Apr 2021 00:00:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 351A061157
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  9 Apr 2021 00:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617926402;
 bh=zODgvWJOdGPuPLobxCE2HlZWj+0GBcKdnv6srrPlhWM=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=eAmm1Oeiu6SbZlJvxb0PMDKKnn/TG2YLbOac6rmu+fKFoMD1OHT0CBOcEmOv2v1t3
 ztBwUNELsP9OIlkV+dzy/asVXbWxSY3Gusr8FuK0Lwp4boTRgyGOk5XdAEKA8/85OB
 0T6OJHHhpqsrJDgBMX3wkvp5jcMiMqnwfcSq7hNiuZFd+4YssqKBm/t7OAPl6VYEPR
 OqSbb9I72wbay6rZs2DGliwoDvO9qxKWh6ivmUjROay74hGC8/8sOO1bKiKsrf1Wv8
 cwM+BtyvJTcfLrvINnofr83IrmMZ8CKRD3ZUY9hvlY0utVPyeEwiR0SyDbb/tTVZL6
 M2h97raWxxNFA==
Received: by mail-ed1-f54.google.com with SMTP id s15so4445535edd.4
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 08 Apr 2021 17:00:02 -0700 (PDT)
X-Gm-Message-State: AOAM531No1wVjwb/n0TLb0787YgQuSuBQB1VkWzt+BvWR0RGQ0NO7Ye7
 XwGJIYqxYxUfttJVX3PaL/cvJ+2q3PVSeXJ4gQ==
X-Google-Smtp-Source: ABdhPJyq1vEW/srr7/XjdqQZ+IQDTHq27/v77Kb6sn7jMQI4z0+Cf9Iy9t5TL6iMv0qg8r3L+WFfSt/xZR6erabb6rw=
X-Received: by 2002:aa7:d3c8:: with SMTP id o8mr14894711edr.289.1617926400690; 
 Thu, 08 Apr 2021 17:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
 <YG8gaHqlJ+oCfkTt@piout.net>
In-Reply-To: <YG8gaHqlJ+oCfkTt@piout.net>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 8 Apr 2021 18:59:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJD7Tx4o2J3vFCGMNPcJmi7LtbZN00oSUdT7bDXo3UF1Q@mail.gmail.com>
Message-ID: <CAL_JsqJD7Tx4o2J3vFCGMNPcJmi7LtbZN00oSUdT7bDXo3UF1Q@mail.gmail.com>
Subject: Re: New 'make dtbs_check W=1' warnings
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, DTML <devicetree@vger.kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
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
X-CRM114-CacheID: sfid-20210409_010006_503174_692A285A 
X-CRM114-Status: GOOD (  12.37  )
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
Message-ID: <20210408235949.wY7pP1N3B9dwJgwCaGQNos3jQuJOn5QH2Glmu4Yg9I4@z>

On Thu, Apr 8, 2021 at 10:25 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi,
>
> On 08/04/2021 17:08:26+0200, Arnd Bergmann wrote:
> > arch/arm/boot/dts/at91-sama5d2_ptc_ek.dt.yaml: /: 'etm@73C000' does
> > not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$',
> > 'pinctrl-[0-9]+'
> > arch/arm/boot/dts/at91-kizbox3-hs.dt.yaml: /: 'etm@73C000' does not
> > match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$',
> > 'pinctrl-[0-9]+'
> >
>
> This was introduced by 4d930c421e3b ("ARM: dts: at91: sama5d2: add ETB
> and ETM unit name"), trying to fix another warning.
>
> I guess this is because
> Documentation/devicetree/bindings/arm/coresight.txt is not yaml yet.

No, I believe it's from the uppercase hex.

Rob

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
