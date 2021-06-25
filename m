Return-Path: <SRS0=wsnO=LT=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779D4C2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jun 2021 10:39:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49D0561249
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jun 2021 10:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49D0561249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hU21uO+lQ4+RxRWC4yQwA84GG/9IOsiAcSpmrNL7nEs=; b=BK4/12l5InF4EJ
	0viUkdpXPcM1UHeAk0HDYGUIFgkY0flpQVjJMIZLAASeC1RzhlVYWk7jCD8OjKnPmt1rSwsb04RNg
	sxOOe17EFSseq15rVzbmkyzvZQ2FsKcAgLlsiseAxbVNwedKHwZvzHGAyY/HKif+4GVUDr6dgbrut
	6CprdSfOUAU1s0/wPr3KeTuygT/1f6KVrZzScHV7GCTrovOVPjIiAI5oZ6KrM7uq033VykeUxiGv6
	KEWgbYO+SxRSUzgOE08O7BiTqM55Nr+cL28s3nP3rxnPh3plchg254Rnqkgv+uVMelsDvtejJ868k
	uF7BORsaCXkEecqB8iiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwjDF-001178-JW; Fri, 25 Jun 2021 10:37:30 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwieY-000pC9-S0
 for linux-arm-kernel@lists.infradead.org; Fri, 25 Jun 2021 10:01:40 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MOAr1-1lcimq29Hd-00OWK5 for <linux-arm-kernel@lists.infradead.org>; Fri,
 25 Jun 2021 12:01:33 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 k30-20020a05600c1c9eb02901d4d33c5ca0so13720wms.3
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 25 Jun 2021 03:01:33 -0700 (PDT)
X-Gm-Message-State: AOAM5324paOPUhj7ayViTFVEjZFs/H71PDcG2nyw/gQG5YIoqPXrk5GC
 /xREChBQWlo6Yu1Wxwcd9KanDLxyYwwpmuPwzpU=
X-Google-Smtp-Source: ABdhPJyRRakIybOAARLEqgqFsAKTsqLCItavkxySt7puA/r0GJ3aVYwMKoJP0QL2cw8hz9fbIr1BZHd9ZDHu2XJ9KFw=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr9700348wmb.142.1624615293093; 
 Fri, 25 Jun 2021 03:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210625095000.3358973-1-mnhagan88@gmail.com>
 <20210625095000.3358973-3-mnhagan88@gmail.com>
In-Reply-To: <20210625095000.3358973-3-mnhagan88@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 25 Jun 2021 11:59:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3NAOgBa1j+Zsm6FwSm2ux49rFcnTEYJJsmSF8TggRnYA@mail.gmail.com>
Message-ID: <CAK8P3a3NAOgBa1j+Zsm6FwSm2ux49rFcnTEYJJsmSF8TggRnYA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] ARM: dts: NSP: Add DT files for Meraki MX64 series
To: Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-Provags-ID: V03:K1:nHv1Oq4rFDFyt1InmV8tXQ7Xo4w/uEvxPaVXhuWPfND9MD9QOXk
 3p5ofZDHieMYVwnUpeswQBaeijHxGI35Nd1g3NJqxeJz4l1MHU3Cqq7ASoL9w22QBssu5lQ
 GuqlQrzxlivuUbbd2/X/JSBsktvpNEiXCkQbQA/OSnIDnSWejqX8nzCY6SwJE21WsiltxqC
 Qv7Cp8tBSBMYXms5PXnCg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:y5IC4J26/sg=:oVxGBpd5cvA5Eic1r2B1H+
 u76vpkxMv1X+BsFxtbT0m24lcvn9HCx0WYd8ChBifA76Xjs7jQN3xKfpVV9Re84uzpKCyw9ci
 FR/wZbVzXLX9umlo2sZTuqOqigfg75Gtnes++cILPeB8nG+mQsw6j34IqI7Qq8NgFWyb2KBuZ
 DMQ0rs4MYELiovRLZUrZN9oA4Do7Dp3ugAeYmEmJoJdaXyDJOvppW4HwqfV7xE9hk3wpu/T0R
 xS7LUSWgLm+I+oQMyyvumDEyoQFOz0dWbNx/fR1bqX+oVELNjFfKx1+TqbdOTJTxrga47rLCJ
 nNYQF9DzDAqZfkr3d9HYT90WDvG+Y9s9RkRrglAEu159xpKWRLfw0+t5Avse4SHIoq4Un2AwZ
 S+0vQzxtfyhJVH6pyZbf2pQ9ygkNg3yfdGXlUy8apjF3PjNGTaaPCUHuNvaz/lAgIDliUgxcU
 /TIwGZ1rpXCWoqotG3fsfQJhq5/JVJknpRk4PN452s/IGIUBO0S5agFdd8hSTzf/7uGfB8Zt5
 7aarenUHzEWdLHk/snPAGAouoWku3q8BxThe9JlyTDYqpeDthvXYlLvmZ9A7omPfr0qRoFbgB
 5Git9SIVq0pUikcF03uLMk2p9zDkfO97y6jDYLa6uEvipbsBL4r4qZvCsExetlJA4wEhl5hyI
 ZNjY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_030139_259187_5707D044 
X-CRM114-Status: GOOD (  17.43  )
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
Message-ID: <20210625095908.opFVd1W1kHvhTNjVs9plZY2HB9gYf6Itcs1H9JTeVrE@z>

On Fri, Jun 25, 2021 at 11:52 AM Matthew Hagan <mnhagan88@gmail.com> wrote:
>
> MX64 & MX64W Hardware info:
>   - CPU: Broadcom BCM58625 Cortex A9 @ 1200Mhz
>   - RAM: 2 GB (4 x 4Gb SK Hynix H5TC4G83CFR)
>   - Storage: 1 GB (Micron MT29F8G08ABACA)
>   - Networking: BCM58625 internal switch (5x 1GbE ports)
>   - USB: 1x USB2.0
>   - Serial: Internal header
>   - WLAN(MX64W only): 2x Broadcom BCM43520KMLG on the PCI bus
>
> This patch adds the Meraki MX64 series-specific bindings. Since some
> devices make use of the older A0 SoC, changes need to be made to
> accommodate this case, including removal of coherency options and
> modification to the secondary-boot-reg.
>
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>

Removing the dma-coherent flags in the dts file seemed really odd until
I read the text above. It would seem more logical to me to have a .dtsi file
that has all the a0 revision specific changes, and include that from the
dts file.

On the other hand, the /chosen, /aliases and  /memory nodes that you have
in the .dtsi file should probably get moved into the .dts files, as these tend
to be board specific settings, even if the examples you have are all
the same.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
