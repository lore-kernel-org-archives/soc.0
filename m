Return-Path: <SRS0=5jFp=JJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECB3C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Apr 2021 11:34:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9135161244
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Apr 2021 11:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9135161244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nn+1TiMPU4nHsvVHOzrTmTwHKMYJOQSrteA7hF0y3xU=; b=P5Ds6MsjQZB+4huFjGreFSTVE
	7O78kWZ0KvMOiRVVrCHhVC/ywDukWoOeLf/9oXPyF23WZrr0GQxy2R0qqpkxQeLwp5XtUAJUvK/tL
	IAYNAF4vggWll/VBr7+0qM2otLvVcHb6a1i0WI5Yzl3G+hHjot2JPWdLqTThhc10cxYCRU9PEx3Go
	tCzmRzYfGyEg6DXUXLZDUiDRg6Q58e67cxitgbOPAP/cnJjkx1nleafhlCwZP4uD4Sp+6JJUlhzP3
	aTtfSttKHYOYqigfDGL9vm4NPn33S8JiL7uj0D3weD4wJsBTdlDXPnQPBsO268Q+OxYkDixieKSnf
	3Bs+ShS1w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVuoe-006ZWe-LJ; Mon, 12 Apr 2021 11:33:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVuob-006ZW1-NQ
 for linux-arm-kernel@desiato.infradead.org; Mon, 12 Apr 2021 11:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/BtLuken7/ATnnaUkY5iHVkSwH8IiGzx/qlI7A0N+vg=; b=wlY/Y+wGnmBSWc9cT98x2YhyA/
 rknXI7zlb3MXVJzw4BFpBMn/nQPmCi6vSc7+PL/hWtoGQraXzr/dhBIf03DnAB/SNBlsFmh+W/i+z
 9thpiO4cE0IqcOe26dYGIzNSKOGDLcczFVfkDqabZPZyMrEHyKI9um2X7Y0RGqJvX6ZOs5fMwYfLo
 f8iHkNhh8BeiJGGSafPHVoEMvj2+zjptOI/jTTRAMTWWVaf4Jqv0OR3Sb7ktSD4szx22KgXi9Jfbp
 Ag1fhk+OIVMz4wH0eH2pBLf6CD74hSIDSKX8phWmbMTRXAhY7lbZd3JGs3Miuo4sI+VTxjYAFoHDv
 2o6Rn4Iw==;
Received: from mail-ua1-f51.google.com ([209.85.222.51])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVuoZ-006BKa-16
 for linux-arm-kernel@lists.infradead.org; Mon, 12 Apr 2021 11:33:12 +0000
Received: by mail-ua1-f51.google.com with SMTP id h34so4110568uah.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 12 Apr 2021 04:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/BtLuken7/ATnnaUkY5iHVkSwH8IiGzx/qlI7A0N+vg=;
 b=WJqEBBFdsrmkroiVz+NMPCY2G49qiqNEZno1FXh/uj+AIQgHItxz/vCB/bhcRFEcs7
 9WnFy6W2OtsC9hUGm9u0oT74D7xD0vJnwcyRPXshV4Hy8EwqIkHapDxOtq37obmLMoVI
 dxSNyQ4N//iAPhrpR7GaqtDff6ePciHwri3c/BZhrgLeKuGuabSJrU8/DiHDH0LD6vDR
 JzZYYOLTrZoT9eC9bEO/Piebw8c84aM+NtsReGavI3NtrxEumd8AScVpzbuOpsMu5GVf
 Cjj7ChnJjJ6gk+KJNERpI63HBwLZChiw/9FLgvCyX8RNbt2utzRiYmyeG30LCBAodVAz
 6Ukg==
X-Gm-Message-State: AOAM5308wg16VpjJp8MzDuMhw8HCix9/NKwZ6o5nAZYwWzxbO4X52DNU
 +kQdMKydRuoUoxxMDJqgBN/FqdFq5YWZ4FXU8Aw=
X-Google-Smtp-Source: ABdhPJwc7H2iNse606hnm01z3wmnOaEjTehppMFD2rGS5SzORSJzulLQ3INeDmOJwFpkG1K0oL1+YL7jRWDlysWfhK4=
X-Received: by 2002:ab0:3157:: with SMTP id e23mr17802147uam.106.1618227189854; 
 Mon, 12 Apr 2021 04:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
In-Reply-To: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Apr 2021 13:32:58 +0200
Message-ID: <CAMuHMdWY0aGoAw6QfF5PQRFNFwAzNP9cmFCjbKnsSbHsMz45fQ@mail.gmail.com>
Subject: Re: New 'make dtbs_check W=1' warnings
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Linus Walleij <linusw@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Alexandre Torgue <alexandre.torgue@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tony Lindgren <tony@atomide.com>, 
 Shawn Guo <shawnguo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, 
 SoC Team <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Gregory Clement <gregory.clement@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_043311_096323_8F883F53 
X-CRM114-Status: GOOD (  35.85  )
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
Message-ID: <20210412113258.4jK5Gd_Pyj2iy4OHcBh8iHglTcLqdm71Z84IeMNa3DY@z>

Hi Arnd,

On Thu, Apr 8, 2021 at 5:08 PM Arnd Bergmann <arnd@kernel.org> wrote:
> I've just gone through the DT merges I've received so far and, with a
> little help from Rob,
> managed to run 'make dtbs_check W=1' before and after, to see what
> warnings we get.
> The good news is that the number of warnings is going down, but
> unfortunately there
> is still an unmanageable amount of remaining warnings, and some new
> ones crept in.
>
> I'm still working on my tooling for this, to catch these better, but
> ideally I think we should
> try to not introduce new warnings. I think some platforms are already
> clean, and I did
> not see any new warnings for mvebu, samsung and broadcom. There were a lot of
> warnings from .dtsi files, and I probably did an incomplete job at
> deduplicating those.

Thanks for running these checks!

> See below for the other platforms, and the new warnings that I found.
> If these are
> valid, please send a fixup before the merge window, and let me know if
> you have ideas
> for how we should handle these in the future.
>
> For this merge window, I don't think any of them are show-stoppers (Rob, let me
> know if you disagree), but in the long run we may want to gradually enforce
> a rule about not merging changes that introduce any new warnings, in order to
> have a chance of cleaning up the existing ones.

This may not be as simple as it sounds, as DT binding updates typically
follow a different path than DTS(i) updates.  DT bindings updates may be
picked up by a subsystem maintainer, by Rob, or by the platform
maintainer.
For trivial updates (e.g. adding a compatible value, and sometimes
extending a limit), a DTS(i) update may be accepted by the platform
maintainer before the corresponding DT binding update.  The latter may
even be merged one or more kernel revisions later, especially when
involving subsystems that are not traditionally rooted into platforms
using DT.

Of course we could mention any expected warning regressions in our pull
requests for soc.

> renesas/r8a774a1-beacon-rzg2m-kit.dt.yaml: csi2@feaa0000: ports:
> 'port@0' is a required property

[...]

I've replied to these as a response to your PR reply, see
https://lore.kernel.org/linux-renesas-soc/CAMuHMdWHLnXgBSjP7VKUdx-YNr9rSKFkE5Ge5q_tarU6HP9Lhw@mail.gmail.com/

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
