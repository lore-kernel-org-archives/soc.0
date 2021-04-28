Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FA6C433B4
	for <soc@archiver.kernel.org>; Wed, 28 Apr 2021 09:49:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0A06A61428; Wed, 28 Apr 2021 09:49:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E7D3E61426;
	Wed, 28 Apr 2021 09:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619603348;
	bh=BTpapuBCvK1/RzTALLtgh0umCIaMOFFwyezbD4WPKjQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NVKhs5s2/m+jTVt2mdLsRYr0hHck4BndKULTjPwoKQI1mM/X+DJ5NRBujJAsFBhWn
	 HnDawrCbfj8SG3WCp3WPUZWAyqYUEN3X1hJGHs8wJQ1k0+88AFp1T2dMep4SL4Tj5Z
	 xy586wQXX0KefZtqp/gUtfVyvJqerZtQKW+AmOWety+He40wffQWAiKf44Xd6VnuN2
	 W6QEmUQXDp3ZBgHk2U0vhrEdLhV5Nj+lNh0k8SqJEcSo9dJcTkeDVZsvoph69t4ES0
	 xseQH/Z7kWd9p5y9KT1yYGOMe1lIilSlHCmVlAqoEI7VxIQDCXAEuq9YphDc80yGt5
	 gkh76a/STWTVQ==
Received: by mail-wr1-f45.google.com with SMTP id h15so10081333wre.11;
        Wed, 28 Apr 2021 02:49:08 -0700 (PDT)
X-Gm-Message-State: AOAM531fGYSDwnCLwthoU6BN5jCQIH1OhpZak/QYPxX3DBzRbX25vYRw
	aq29kq/oDau5Kte3nhIwcM6B27gHfrHFA4KVLAk=
X-Google-Smtp-Source: ABdhPJwxYZOTgwv5/iaUwcCx9k5yg6cFv27JHM+ZB0SjvTqa2xFdivG1Y2/xDb19d5IfIeNHas5Zl6K9joPLfnC+YGo=
X-Received: by 2002:a05:6000:1843:: with SMTP id c3mr36114955wri.361.1619603347393;
 Wed, 28 Apr 2021 02:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210427210121.1080364-1-arnd@kernel.org> <YIj8sySF3W0x8E+/@kroah.com>
In-Reply-To: <YIj8sySF3W0x8E+/@kroah.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 28 Apr 2021 11:48:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Fae0B+3KTqWx_f1nTUhr5sKfYMRo6zJHFQENo-KTjzQ@mail.gmail.com>
Message-ID: <CAK8P3a3Fae0B+3KTqWx_f1nTUhr5sKfYMRo6zJHFQENo-KTjzQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: nvmem: mediatek: remove duplicate mt8192 line
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Ryan Wu <Yz.Wu@mediatek.com>, SoC Team <soc@kernel.org>, 
	Fabien Parent <fparent@baylibre.com>, DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 28, 2021 at 8:12 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> > @@ -7,7 +7,6 @@ Required properties:
> >             "mediatek,mt7622-efuse", "mediatek,efuse": for MT7622
> >             "mediatek,mt7623-efuse", "mediatek,efuse": for MT7623
> >             "mediatek,mt8173-efuse" or "mediatek,efuse": for MT8173
> > -           "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192
> >             "mediatek,mt8516-efuse", "mediatek,efuse": for MT8516
> >             "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192
>
> Shouldn't you drop the bottom one here to keep this in sorted order?

Indeed. For some reason I assumed they were meant to be in chronological
order, but you are right that the others are all sorted alphanumerically.

Fixed in the arm/fixes branch, it was the only commit there. Thanks!

     Arnd
