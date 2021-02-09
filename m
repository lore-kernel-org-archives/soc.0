Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42265C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 08:27:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB90964EBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 08:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB90964EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R2cqJO8ANojwOhhGZooK2V8j8pLDWfdHit6ULv8obvY=; b=xUTVLUB2vhwgUxRtIynWADdFO
	bqMafme9lkjDu7ppXgr1WSorfgT8daU8QYw07eHCfdNV+h/oqNfhZW7z+lVk9k2ooZ6vsp26KSnmW
	bHbah02t6iIIlLWVhsPr1VK10guEhlOI3fFeQgpkjBT63bQc6SBsctHx6t6/9r0EvpAX4+VqP6VO9
	9D4BI21eaHX19UbN5pGUKYe5TF2BXM9huQOTvUS3AMae+FSaG6yQtwXEt4/P/eq9HHXsSbAMriAGD
	tRodu9sgXU2wyuwrA35RyhVIenxAFpEAq3zxBOX5M9uFxTDgcHCd7/8fgFYgSvuDL5Wbhq5rhXmst
	cqj9M7s/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9OLD-0001c7-CB; Tue, 09 Feb 2021 08:25:47 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9OLA-0001bL-J7
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 08:25:45 +0000
Received: by mail-ot1-f51.google.com with SMTP id 63so16788691oty.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 09 Feb 2021 00:25:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lNbh7LjdqrFqGa+5oSbQ+cwJwgupwerGD92n/ai+/tU=;
 b=DOCiiLy91qUZ/klf80yjtB795BnWkMNXQwjnWCL3Sz887RydEYvkPvB4uEE7V8aLy3
 eglZZUt7JzZajGJihR2FhJkMaTEAVfrTHBG0+2R4nivM2wUPUKNT6yjVGVp7KrFvX/XJ
 OIiOYT1CckUMeF8WQNBcIz3SVtqbQ6SA9T9+R+rCVmVZvbOBcHClDiOLB95ZZqm+UfgJ
 Iw43iDP5MhZkU/Lza2q61Rtc2/u0l0GooLwWsuVbVuPqK2kXwd1o++AHHSP1Klp1O50K
 1DgeFMofSMAVy+oH0bHthZOwdM/YIzbjMOeyFjLd1BORfqzaWY17TZG1U/Ki5N7SGWPu
 OhBw==
X-Gm-Message-State: AOAM533gFpjNLiymRfvVlW43tGrxcCRPVMabrJOM4uMAAytx+MbqwWQ+
 0ODKmfuaxjtBhggWcp4LxNRBRummHTaoGLU02RQ=
X-Google-Smtp-Source: ABdhPJyHYllDbGGarpfEfSMLq+6yFSlPIZ/1ViJwMsZFWXHFp6l5RgUa1BlE4L4SlzEI1vlM0qByA8Z7RtWYZngawdw=
X-Received: by 2002:a9d:77d6:: with SMTP id w22mr4174886otl.145.1612859142032; 
 Tue, 09 Feb 2021 00:25:42 -0800 (PST)
MIME-Version: 1.0
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
 <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
 <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
 <YCGBIvRfoP0BeyrP@builder.lan> <20210208184230.onhlioflyylkx6xo@kozik-lap>
 <CAK8P3a3bsw8p2Geyo-vh1AJUfMQCCf3kpa_YB+tKmcvWHqRcEw@mail.gmail.com>
 <20210208213537.GA351084@piout.net>
 <CAK8P3a0QRcQM4rH9HgVMOHa_eATXsjRbGDXuMO7FgnA8OgPk0Q@mail.gmail.com>
 <20210208231040.GF351084@piout.net>
In-Reply-To: <20210208231040.GF351084@piout.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Feb 2021 09:25:31 +0100
Message-ID: <CAMuHMdUSRZ+Fho4OG3xZayzOrFnJXxomT3q16vu_Jai6Lb7hxg@mail.gmail.com>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_032544_694362_BE89768B 
X-CRM114-Status: GOOD (  18.95  )
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
List-Id: <soc.lore.kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <snawrocki@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, arm-soc <arm@kernel.org>,
 DTML <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@kernel.org>, Olof Johansson <olof@lixom.net>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209082531.qtmOs4Tgp6kSre4k09gErQRgmkjz26UfmiOLQEGb1H0@z>

Hi Alexandre,

On Tue, Feb 9, 2021 at 12:10 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 08/02/2021 23:14:02+0100, Arnd Bergmann wrote:
> > On Mon, Feb 8, 2021 at 10:35 PM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > > Are there really any platforms with the dtb built into the firmware?
> > > I feel like this is a mythical creature used to scare people into keeping
> > > the DTB ABI stable. Aren't all the distribution already able to cope
> > > with keeping DTB and kernel in sync?
> >
> > I think most traditional PowerPC systems fall into this category, most
>
> My understanding was that the traditional PPC systems had a small device
> tree and usually are not affected by driver changes but I may be wrong.

They were much simpler than a modern SoC, with most functionality
implemented by modularity (e.g. PCI devices, I still like 'compatible
= "pci1186,100"'[1] ;-)
And the bindings were simple and stable (i.e. they did exist before the
platform was shipped).

[1] http://users.telenet.be/geertu/Linux/PPC/pci/ethernetAT4/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
