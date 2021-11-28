Return-Path: <SRS0=sWnU=QP=gmail.com=festevam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57934C433FE
	for <soc@archiver.kernel.org>; Sun, 28 Nov 2021 20:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 442F1C53FCB; Sun, 28 Nov 2021 20:51:54 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0243C004E1;
	Sun, 28 Nov 2021 20:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0243C004E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id o1so29754668uap.4;
        Sun, 28 Nov 2021 12:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mJdw8+B+469lEUinr7Yxatle2qjN+p5Ob+KVnBKytm4=;
        b=dsu13FhAcDiygfmSbxULHp4GEXJHqRU/YAenvG+Tf7Hz2aiMpp/AE+rnWDXLY1NAJW
         wgyfTW89QOPU3zdLqhiVSP/Sv+svFMu2mBPy6aYXpcCuGC5wXvpXejTKbvEidiYvFch6
         IGDdl/Nmp6Skz6Zq0rCuNxd8RGBWWKscG5C3sMmi0UCiPy8u3oGMD8kdz2SkvXQvoT4G
         Yni7dznjeI2jiVZ7ps7NBDG5KCwt7tlunIqH4dBqDofe2FRCazrz2W+7KpnKXQHUccoh
         ftuu9mf2t7a57InoQ3uDY9qPBPVIqK9kleBEVlOtqNyLMPX3rDzsRMWpXq/yYR+nEt+v
         QMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mJdw8+B+469lEUinr7Yxatle2qjN+p5Ob+KVnBKytm4=;
        b=b3jez2rdiRvPk5dIRn8/TAjD4GlvUpzce6GGsx3Cb3ipbC46osKtAKcT282VJ+7x8c
         aS/eaZbCgy4woYsjCLnZhi+CzpZWvbxtHsgIo6qoRVh/DpxV7mFnk4oLquyVaFJAdHeC
         XsV5B13K5lRr7r4LCkK3+0qxi8VqjzLRm7A8j+wrQjRWE0ZNyp0opHD3o8ja+uYoNPHe
         XO1kbu1T+2q1mNw3Mesk4XbsPyD73rBlh+wJRMiWozH/Yuo3CvgBhmU7npHiXiHFyZWN
         mD8g7PYv40xmZXYKHmqe9u64pUCGYxT01/hcJsRWyTMMPBQ35ygl9na2hqBo9U6eH8Gz
         yJbQ==
X-Gm-Message-State: AOAM533Fa6bARxNlz3fIKKJqRNANnQbjzHgzIBY41S+f9ipxxAR5DZ+z
	keYyqFPl8e6Vt39QbZDyMa5oVL78Wf6sMiLvmkIPxBbfOFk=
X-Google-Smtp-Source: ABdhPJynMWaOJnX0hrkBHJUH9VWS97JL7n8UsFCkiw/NzxJUQXKpFjsZQm64YrPy9ZIE5Gxp2tLJ3pplY9uaDBQFqlQ=
X-Received: by 2002:a67:e003:: with SMTP id c3mr28621655vsl.51.1638132712814;
 Sun, 28 Nov 2021 12:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-12-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-12-Mr.Bossman075@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 28 Nov 2021 17:51:42 -0300
Message-ID: <CAOMZO5A8sOJLmYWLU4BZzL=C-PnXvgDOYEodtg6sHcP7tetJkg@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk <linux-clk@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 25, 2021 at 6:15 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> From: Jesse Taube <mr.bossman075@gmail.com>
>
> Add support for i.MXRT1050's sdhc.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
