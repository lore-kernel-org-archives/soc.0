Return-Path: <SRS0=cIAp=YF=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE5DC00144
	for <soc@archiver.kernel.org>; Mon,  1 Aug 2022 03:35:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8CC2C433D6; Mon,  1 Aug 2022 03:35:56 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8BDBEC433D7
	for <soc@kernel.org>; Mon,  1 Aug 2022 03:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8BDBEC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id gk3so5842119ejb.8
        for <soc@kernel.org>; Sun, 31 Jul 2022 20:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=0m19xul91R86k8DEexJNxJ8DkAD1SHNbLLgZJzPMLMs=;
        b=bUJKNpb/F+rx6AvBBbPVFKQv+oJA4OSp2Or02UQ6YphL4VnDS5VlMR5vA+3ZzjIrGz
         exrVdrTb/K6S+8dH+epfjiMgKd8p7+u86RapPOk6ZFqSco0zTLwBdaBkcIIkTR0yMbZQ
         9KC9h0CmTASJS5gKma0ziZyxGnQJTFD5IEscbjgKQ4C98aQNwdDLku9pmbpdkndcpQTG
         XVCcwAkHtiuC7XH3xTtVEc5MCvNgZ32U26ClhAwWBsRlwnEWFDJN7n/iSEqLQShqoa04
         dglodgFw17OBv4xY2z9CFyXfoTQpn3iS6PNdPZm4JAQnRbJ+bqZGSQ4gfzjO8jotu8ZS
         YG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=0m19xul91R86k8DEexJNxJ8DkAD1SHNbLLgZJzPMLMs=;
        b=oVl6nSdeRmniufjTCMPP0/SxlYwvAGVWB/IwigN2Ip/RQ/N//+nUwE4LOIEFB+5uQu
         VeH9FgDYHXPBO5ZHOJMGgRo99dnv7vmCHQ4wbrzKgdRVT1r3QhHalb7GXp3WhO3dyYsE
         PMh3kKIX6cNJ68vpM+K2dBA3Zkzf1V7KFUaz08fTkXjTQ4B/jdAqM5Wl+aMPGEDqd+Mw
         Q5CnnmHRLrI/prx/9gtP8yBWocYTx4vqqIO7xRmI6EHSoP0KExAKBf1uTys+/OqBNp3L
         XzD3WayV6edoa9+aoKmurpAfZlI+GqYbr/vS67gpZaNYzdtP+0MNQf2xfXsn0urOGDCk
         akfg==
X-Gm-Message-State: AJIora8nXT+86yOeK0p0kR5wBG8nVSG+Sc1MaO2Aq6y68lO7i9WiAYtk
	hQ2iASAjVhNGIA/FAnGeBm65ZtgG6dsfwYrAW9thEQ==
X-Google-Smtp-Source: AGRyM1silTJw3gfBynYBoHZ4TGkaR1/cr19Ed8t8xWvf2TVhKzeYNVuTNYgUzPFZSt0dOc5mknErEqhfHfUsSXAxGgI=
X-Received: by 2002:a17:907:28d6:b0:72b:7497:76b with SMTP id
 en22-20020a17090728d600b0072b7497076bmr10694705ejc.365.1659324953801; Sun, 31
 Jul 2022 20:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220720230140.2113129-1-bjorn.andersson@linaro.org>
In-Reply-To: <20220720230140.2113129-1-bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Sun, 31 Jul 2022 22:35:42 -0500
Message-ID: <CAOCOHw5vj7WExi2opJ+ZvxLroq9UScHMMTuyyysMs3zJEfxgEQ@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig more updates for v5.20
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Andy Gross <agross@kernel.org>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 20, 2022 at 6:01 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>

I don't seem to have received a response on this one, can you confirm
if you were able to pick it up for v5.20?

Thanks,
Bjorn

> The following changes since commit 76f11e77f919397f31198354cd0e0bd8e76f8748:
>
>   arm64: defconfig: enable Qualcomm Bandwidth Monitor (2022-07-06 15:58:13 -0500)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.20-2
>
> for you to fetch changes up to 01579b88a03a90af73b584fed70d171c73c2c540:
>
>   arm64: defconfig: Demote Qualcomm USB PHYs to modules (2022-07-18 18:56:02 -0500)
>
> ----------------------------------------------------------------
> Qualcomm ARM64 defconfig more updates for v5.20
>
> This enables a few of the core drivers needed to boot the 8cx Gen 3
> platform and demotes the Qualcomm USB PHY drivers to modules, as they
> don't need to be builtin.
>
> ----------------------------------------------------------------
> Bjorn Andersson (2):
>       arm64: defconfig: Enable Qualcomm SC8280XP providers
>       arm64: defconfig: Demote Qualcomm USB PHYs to modules
>
>  arch/arm64/configs/defconfig | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
