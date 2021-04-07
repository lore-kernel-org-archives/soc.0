Return-Path: <SRS0=LeP6=JE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01358C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 22:17:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B3F76121E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 22:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B3F76121E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Iv3k7TAroEs7TX3aEdXox5JiTD9tg8qkgY8hNEE7k6k=; b=fN3mZ99GXN+EKQ3GjASUFRoSL
	TuwJUCDLyNXXD3Wn7gVorft6oSTnGBHlYO8ynf8B15n+7Ae4jYTQwC/vIgR30F6w7JlUTcC0wC3IP
	L8TfGI9o1VncdCJL2g9B5/+uut1sqRCTRj3jmV1/jNEEAGg8vOjQN0z5MTV2VkLt5GU7ThExi46yn
	JrTfKgrvx88Su7rv0PiG8mfNFO2mKTdJVy/QVDwQ/bPlTXlasslNWOPh6JJ4BOWx0XoAFIxyIcfUq
	Ofi3OH85+A10AyeoPc4J9qVhrOIvsKTZ4rrej6x9lnbJV5IOWLIiKlyzn06SxA/9L/72bV3AyHP6N
	77QZa40oA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUGS5-0069z0-Jp; Wed, 07 Apr 2021 22:15:09 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUGRz-0069v7-7v
 for linux-arm-kernel@lists.infradead.org; Wed, 07 Apr 2021 22:15:05 +0000
Received: by mail-il1-x131.google.com with SMTP id d10so75621ils.5
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 07 Apr 2021 15:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QzKyYf1bHGK6AtnOk88opCZuU9Drjf8q36capzyYvC8=;
 b=lsvrDNOViZSFR1LHCc9XrTnkkJk2/1clOaEdZ65RDeQd5vI3Htoqs9pg8ZsvrjPwHw
 tx5oCCum0RMEGsgod/WZRF3+pDAGxqCpKMrZMv76mjUUebS2KFwvd5q6DOszx3h5XR+l
 LfI5vAnUe/W4a+UBo266PzF1bjUD13WKDwMKXC1tVjGmYM1/S7hQ6CGC+6yLA42DL7QM
 dNk9ZxCWMQSLIIH+pblEvIWSvl4yOvxHZGNNI/piDIdgr3Dd/b6xFSk3lSEeba3U9joK
 AU/SRfmBSEVcsg3T1PnunbDephSWZcZFPmWa8kto8kSDgby4E1yzO8BQO79stHQTub4F
 YX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QzKyYf1bHGK6AtnOk88opCZuU9Drjf8q36capzyYvC8=;
 b=UbGa0G37StZmSQNUdm4KduPy8woyYuh7SzqV6FTqt7M5UPOUHg/E61A9qGpUztcmqL
 g4IWPGmIaFekYVZ60uOErmlfFDBS3GBOY7Dt51JDjVOVMwTy2PHLZwsTT4wohVR6WNIU
 XC8WcGxxIixCkGgy8Cz+p/CSd9ufLGwsESUPteJh9uK6ZaijN634SvZIQV2eFjpofx4T
 J0nPbykT856ygB00gLmbRmKdFX5GbzTysQ/2xgKPVU9KrcVIjanLY/wlE0A6uep/rZ67
 TW1fsbf+Uu4rKt8nwH0NX/67VJ0KKdN+tV6K6SK0wygEdorBA1vzlEJptUM+UEf425eP
 LhuQ==
X-Gm-Message-State: AOAM533K6L16WO+fkrjM+WNtkKdc5sBgvKzLevjUgNu4ipZe0YlYVBJY
 YKTzgv9GxvCkEM5FjFn1RHL0BtEhhbRplTW5WFPOYw==
X-Google-Smtp-Source: ABdhPJySz1xoT7xQVligVV9v3QSICXWrplknepoG0630xLscPoS6xyyapHtTzMksUc++H4qNT7FARgnA+moEIJCZI1Y=
X-Received: by 2002:a92:6810:: with SMTP id d16mr4757496ilc.88.1617833701020; 
 Wed, 07 Apr 2021 15:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <22814673-e9fe-f65b-cc0f-b02be4f90d1a@gmail.com>
 <CAK8P3a0bp3CUzOQHSX5KYt44j-Njk_u2P=0q-ZQ0HcTBiVVVSA@mail.gmail.com>
 <01c82108-64a8-33ee-3984-5bd7056a0002@gmail.com>
 <CAK8P3a37BUdHneO+9+t0Pan3UWZHub-ishcKLNxCbqO0kk0CNw@mail.gmail.com>
In-Reply-To: <CAK8P3a37BUdHneO+9+t0Pan3UWZHub-ishcKLNxCbqO0kk0CNw@mail.gmail.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Thu, 8 Apr 2021 00:14:50 +0200
Message-ID: <CAOwMV_yQLWwMEQ_f_wHOAipgD1qZgNz2SA2RJDZpNozCKv4vWQ@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: mediatek: changes for v5.13 (second round)
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Irui Wang <irui.wang@mediatek.com>, 
 Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_231503_337154_21B6EDB1 
X-CRM114-Status: GOOD (  36.93  )
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
Message-ID: <20210407221450.3IRnHRcLy5KNqKjorHBitmqvYe0-jJtaxKe2SKYPDno@z>

Hi Arnd,

On Wed, Apr 7, 2021 at 7:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Apr 7, 2021 at 6:34 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> > On 07/04/2021 18:06, Arnd Bergmann wrote:
> > > On Wed, Apr 7, 2021 at 1:00 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> > >>
> > >> Hi Olof and Arnd,
> > >>
> > >> Here comes the second round of arm64 DT patches. Hope I'm not too late.
> > >> Basically we add several node to MT8167.
> > >> ----------------------------------------------------------------
> > >> Fabien Parent (6):
> > >
> > >>       arm64: dts: mediatek: mt8167: add some DRM nodes
> > >
> > > I stumbled over this patch adding a lot of aliases:
> > >
> > > +       aliases {
> > > +               aal0 = &aal;
> > > +               ccorr0 = &ccorr;
> > > +               color0 = &color;
> > > +               dither0 = &dither;
> > > +               dsi0 = &dsi;
> > > +               ovl0 = &ovl0;
> > > +               pwm0 = &disp_pwm;
> > > +               rdma0 = &rdma0;
> > > +               rdma1 = &rdma1;
> > > +               wdma0 = &wdma;
> > > +       };
> > >
> > >
> > > Something doesn't quite feel right about this, and I checked with Rob,
> > > who also thinks this looks wrong. I suppose we need to have a set of
> > > well documented alias types rather than just having drivers make up
> > > new ones on the spot.
> >
> > These are needed in the DRM driver, see drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> >
> > I added Chun-Kuang who is the maintainer of the driver. I think it's a good idea
> > to have this alias described in the binding. Maybe a good excuse to move to yaml
> > as well :)
>
> The aliases certainly need to be described in the binding, I think someone
> would likely have complained earlier if that was part of the binding.
>
> Moving it to yaml is also a good idea, and required for any new devices.
>
> > > I also noticed that some of the referenced nodes are missing a DT
> > > binding file, so those need to be added and reviewed as well.
> >
> > I suppose you are talking about "mediatek,mt8173-vcodec-enc-vp8". The binding
> > patches are in the media tree [1]. Maybe I supposed wrongly that they will land
> > in v5.13? Or perhaps I should have mentioned that in the pull request.
> >
> > If it wasn't about this compatible and you can still remember, please let me
> > know so that we can fix that :)
> >
> > I double checked and didn't find any missing binding. Some of them only have the
> > fallback binding described, maybe that's what you are referring to.
>
> Here is what I see for all compatible strings of the added device nodes in
> this patch, as of linux-next-20210407:
>
> $ for i in mediatek,mt8167-disp-mutex mediatek,mt8167-disp-rdma
> mediatek,mt2701-disp-rdma mediatek,mt8167-disp-pwm
> mediatek,mt8173-disp-pwn mediatek,mt8167-dsi mediatek,mt2701-dsi
> mediatek,mt8167-mipi-tx mediatek,mt2701-mipi-tx
> mediatek,mt8167-disp-ovl mediatek,mt8173-disp-ovl
> mediatek,mt8167-disp-rdma mediatek,mt2701-disp-rdma
> mediatek,mt8167-disp-color mediatek,mt8173-disp-color
> mediatek,mt8167-disp-ccorr mediatek,mt8183-disp-ccorr
> mediatek,mt8167-disp-aal mediatek,mt8167-disp-gamma
> mediatek,mt8173-disp-gamma mediatek,mt8167-disp-dither
> mediatek,mt8167-disp-wdma ; do echo === $i ;  git grep -wl $i
> Documentation/devicetree/ ; done
>
> === mediatek,mt8167-disp-mutex
> === mediatek,mt8167-disp-rdma
> === mediatek,mt2701-disp-rdma
> === mediatek,mt8167-disp-pwm
> Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> === mediatek,mt8173-disp-pwn
> === mediatek,mt8167-dsi
> === mediatek,mt2701-dsi
> === mediatek,mt8167-mipi-tx
> === mediatek,mt2701-mipi-tx
> Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> === mediatek,mt8167-disp-ovl
> === mediatek,mt8173-disp-ovl
> Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> === mediatek,mt8167-disp-rdma
> === mediatek,mt2701-disp-rdma
> === mediatek,mt8167-disp-color
> === mediatek,mt8173-disp-color
> Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> === mediatek,mt8167-disp-ccorr
> === mediatek,mt8183-disp-ccorr
> === mediatek,mt8167-disp-aal
> === mediatek,mt8167-disp-gamma
> === mediatek,mt8173-disp-gamma
> Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> === mediatek,mt8167-disp-dither
> === mediatek,mt8167-disp-wdma
>
> So five of the strings are documented, the others are missing. I did not check
> the other patches in your branch.

The binding documentation for these drivers are here [0]. The display
bindings are documented as:
- compatible: "mediatek,<chip>-disp-<function>", one of

The <chip> placeholder is never expanded for all the supported chips.
The 5 existings matches from your grep command comes from the example.
I guess these will be fixed whenever someone converts [0] to yaml.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt?h=v5.12-rc6#n29

>
>          Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
