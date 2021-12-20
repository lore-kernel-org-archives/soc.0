Return-Path: <SRS0=iQxS=RF=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42806C433F5
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 16:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9FA0C36AEA; Mon, 20 Dec 2021 16:18:33 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83639C36AE7;
	Mon, 20 Dec 2021 16:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83639C36AE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MbRXj-1mSTWh2AMT-00bqhc; Mon, 20 Dec 2021 17:18:30 +0100
Received: by mail-wr1-f48.google.com with SMTP id j18so21242155wrd.2;
        Mon, 20 Dec 2021 08:18:30 -0800 (PST)
X-Gm-Message-State: AOAM532FjoIgBfCRVCr0fS/ElmDo0XZSngYLly9OZMqDF+IQMDAUj3tX
	lrBheZqaTQQkZdVnvB38x7lv76Xjon3e7mo37x8=
X-Google-Smtp-Source: ABdhPJyA2LGJ0uydHgPL3F8iobo0HnKBt8FXDwHRu+xqKAdhr7la//Nq7B9um0JBzW7e91O9oTfXHdgSG5Qim03j8Lo=
X-Received: by 2002:a5d:6989:: with SMTP id g9mr13221348wru.12.1640017110131;
 Mon, 20 Dec 2021 08:18:30 -0800 (PST)
MIME-Version: 1.0
References: <0d05e8b6-c56f-bad7-00c1-44682cedb38f@suse.com>
In-Reply-To: <0d05e8b6-c56f-bad7-00c1-44682cedb38f@suse.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Dec 2021 17:18:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1DaHnf0QOMjuvTYGeUttUNkBLhFu0b-43jBAa0bHtLFw@mail.gmail.com>
Message-ID: <CAK8P3a1DaHnf0QOMjuvTYGeUttUNkBLhFu0b-43jBAa0bHtLFw@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: updates for v5.17
To: Matthias Brugger <mbrugger@suse.com>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ben Tseng <ben.tseng@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Prashant Malani <pmalani@chromium.org>, 
	Sam Shih <sam.shih@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, 
	Tinghan Shen <tinghan.shen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:g5Df1+/oJBT5L0tnMhgf5xG3UqVOLhfN8q6HkHgs4xD6z7cHmV+
 Ge+bUAmgRKdAMOU+KKoaYwR4e8I6v+C8/7KXOTNLNIURSsnBDrP3QINs0VCI0L14y4/TQ3u
 hlS4kEUw/p+ZyHaEYYvIZuK5zTYvu5pJF45Oln9Yy9gaP3LvRyBOAtmPzkO+cdUjHoMrZ/G
 v4twBIiGpISNxXi8AJfbw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yMpG9llacEU=:mgQ0BJ0+YbNff1v7PDTbKJ
 Oi2w879+2h1lv4V8ZdCqisIcuxMFuPwmhm3iTtJrNPOPkb8AtLdBw+hiw8iJiooKUtlH4VYf8
 AcXGnNO/aDSFyb6qKuoisj9RRRcMv6vfbZo/AtWYUNWJmc+Zomd6Dzu7ueHcbgn47AxvasFX7
 qQBobyELUXc7qyaJ7anmEy1UxV3GO3xPCofmWp8Ve9a0+bqGAc4MQO8I1HVuOdTkC+YXPn/ao
 7a61ii7o+2obz/XsfWQ3BAUuRHb638K/gCVUoxdBuJWI7oJiNlv4asR6NqFpSolBh6cXCtze2
 /j9bSWjrxungOc1mXUbq1DCN5CQYGLq1ffszROKg9aCwV8z2mwMlj7Rb6bYaT0yZkpXAvsykA
 12G2DHUZ+uC7Ip8X7Mb85ReM/DZ32Z2blJqT+ECfMdMRd1jTZUndubVIAGEAEl7nIQx8QcHa8
 9QeMu+wub9A29rkk8AJX7GjlWeltJ0W0MBxT00SNwmPiZIhxlErIovQohW+bHe2aU3469oSA4
 kJT0pzddo66GeQvG/CZJh0kd4BDJoa4IXffvSp6M3R0lQ51ksADo9aWsxIuIDcD7hgIhpDx3T
 BOAYngLGlJMVZvLp4n5WuyJgQ0rvDEBC72y8pXkouDGpWyHOIOTB9tb8/Sfx5Sqy7rxyhSLO3
 RjuUAs3zZ/02aL/nNqNmnmk7JJ6eAqGxioOQCtmLcFga5GhRHQymeKJJfQ41Se1TbqrKmABIh
 rKNpmVxEFDAfooD1z4lU7wCPixOYLZCPPUOPWedsqmLkbYXtXcIS0WXo6Ka1hqBmhCNg2G7eg
 BBFKW4ZTIzREI3+rMRAdAEwceC7AyyTU/lT/N3RGR1RZDGqJH8=

On Sat, Dec 18, 2021 at 9:42 AM Matthias Brugger <mbrugger@suse.com> wrote:
>
> Hi Arnd and Olof,
>
> Please take a look on the below patches for aarch64 based MediaTek boards.
> In this round we add support for the mt8183 based Acer Crhomebook 314, as well
> as we add support to several SKUs for mt8183 based Chromebooks.
> Apart from that we add basic support to the mt7986 in both variants (mt7986a,
> mt7986b). The difference between the both SoCs are the pin-controller capabilities.
>
> Hope you are fine with this pull request.

I've pulled both tags, but I have two minor comments:

- please put "mediatek" into the subject, that helps when looking at
the pull requests
  with pwclient, which does not show the author by default

- I was expecting you to send a branch for the new EN7523 SoC as well. Did that
  end up not making it in time?

       Arnd
