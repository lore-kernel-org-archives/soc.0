Return-Path: <SRS0=7AiC=O7=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483C1C433F5
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 20:40:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 10BA8603E7; Mon, 11 Oct 2021 20:40:08 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64E5260C4C;
	Mon, 11 Oct 2021 20:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64E5260C4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MxmBi-1mxZu42bUM-00zIfu; Mon, 11 Oct 2021 22:35:02 +0200
Received: by mail-wr1-f53.google.com with SMTP id i12so47242372wrb.7;
        Mon, 11 Oct 2021 13:35:02 -0700 (PDT)
X-Gm-Message-State: AOAM530ZqU/JKQwShHeDxXe8L83ky6ysE52qP9PsdBfd9yCzHxo9E4CH
	2dJnRuROzTVrNH0/1LgClxTCzuq+qyQcDTQZs88=
X-Google-Smtp-Source: ABdhPJx1wv+/ttFg8R4RChMinfeT7b//HX1BFbtzP0lK46YNi2vSxuV3p6bdSOkKi7UXRbaumdbBbEZ7F9jL4U0kXhQ=
X-Received: by 2002:a05:600c:208:: with SMTP id 8mr1181367wmi.173.1633984502286;
 Mon, 11 Oct 2021 13:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <1a3d63a3-c020-3319-26f6-a2ec338cc42e@gmail.com>
In-Reply-To: <1a3d63a3-c020-3319-26f6-a2ec338cc42e@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Oct 2021 22:34:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a06SKo+Y+DiFpozrO0R+67ht1ad6U9dyTa-M9TtD73VcQ@mail.gmail.com>
Message-ID: <CAK8P3a06SKo+Y+DiFpozrO0R+67ht1ad6U9dyTa-M9TtD73VcQ@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts64: mediatek updates for v5.16
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	Chuanjia Liu <chuanjia.liu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
	Enric Balletbo i Serra <enric.balletbo@collabora.com>, Kansho Nishida <kansho@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:9o5Udwejo70PU8XXR4tyh587qGFr6Gf+9HOAIxEc+PZm9724s9X
 CFUp0Fklewoav4XZLqrUvON5J+WVtaVd+50dmcBv04Y5dg9EuT+GdihhOuRxkooRv7vJPSX
 lOJixwsfR33gbSS9LZ/i9eqGt6en8Qqyfs21X82BMsIQoW7fRVDx9aH2/SGbF8ql4S9Aeth
 XeD5fVq+TxudWXeyPF1Tg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yM8Meg27WWs=:6U8nakIwODyiT7AqJOpcl/
 vNYHuSU9BH1fVTUFxPJVb/MFCi9y8AdXgyYU+8NZ/5VWwFHEzZB+6/DZlKB3b01JbKvM2WcUr
 RqYD5odYp/huAzHrjGBXnhZE8fkv0++z1OGuR8bdSzopr9bpEvxZd5HqGobfUOpzXPSUuWjSh
 6Oa8dOzATqDpvYHTLgQn6CKBhFUIeNvh/xem/QDc22JoAa3yQum0LrGmIlTTIPW2Uead1iRl5
 zlf4yaVd9b1P8ovfYuSdH3L1v5dP/pHsOJzY0hzMz5JHgGmZWXsTpf49xnoQzItV1TpSn/GKP
 noL9xN9ii8QhkZt4fPAGutCvYHb05HCSJvVcbgHB0yAwv0rLKW50VTbpA9kLA71SfAPGxHEoI
 h0cX9A8TFKxKJaB1mH+QiOV8/iroeJDaOXSkJHToMiuaPQ5S871gX2jUMvF3e1WUba/0Zm6YJ
 RjpEzxEjs3fDxz4JnaUyGtI8Zwu0abgXyTrB9BzGPySGttoiuSJovCyDGGb1FPUSY8sp6tF/m
 zqmtE5oKsuMS25BdUG49knIvar1bo2YAEY7DB/A/4jVt1NDzI3MzBf/VPdZswPIoCzARngy+/
 GJudCjCXvbf+YhCayQgIPlgG8iH9WCZjRrMLPn7nLm+NsUdflmgaZKRHsxmJdcqLFcXMI0sOG
 quwY2PKup6ojESW6LxEiPdpr60qX1sE80SHl6ROW3VHqwY3yTzZDOIjThRfvPIyE+77RGkTcM
 FuOm2hi+N6OBRCQROGMdEfx9Pdwl5iPYcJbNOgdLS3WYQadGHH4373dTz5lcfiZSazFpB4FUF
 oQ/er1HEjDFvjLgnCj/kbvYmToaZjt0Kr8qUdiObpPj9LyzOMQQFH3Jfr1CpdB+i9AmEq34lk
 eoyPLYhvAUnUO6TuWG2w==
Message-ID: <20211011203446.rZfe_3QQcdbtwV9iKJL03Hgc3u5JoiR6iV4iyL-EuC8@z>

On Mon, Oct 11, 2021 at 11:58 AM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
>
> Hi Arnd and Olof,
>
> Here come the latest updates for arm64 DTS cahgnes.
> Biggest change is, that we have now support for a reset controller inside the
> mmsys. This goes inhand with changes to the driver, that you will find in the
> soc pull request.
>
>
>    arm64: dts: mt8183: Add the mmsys reset bit to reset the dsi0 (2021-10-08
> 15:11:14 +0200)
>
> ----------------------------------------------------------------
> - mt8173: add reset for dsi0 to mmsys
> - move dt-bindings reset controller includes to correct folder
> - split PCIe node to use new format for mt2712 and mt7622
> - mt8183: add audio node to chromebook devices
> - mt8192: add clock controller node

I skipped this one for now, need some clarification. The PCIe node
looks like you are doing an incompatible change to the DT binding,
but that is something that should be explained in the tag description
or (ideally) avoided if at all possible.

Did I misread that patch, or did you forget about it here?

On a related note, the tag description should better have full
sentences like your introductory text above it, that makes for
a better changelog text in the end. Enumerating all the changes
is not helpful here because the list of commits is also part of
the changeset description after I commit it.

          Arnd
