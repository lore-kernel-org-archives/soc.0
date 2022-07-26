Return-Path: <SRS0=o3bE=X7=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED22C43334
	for <soc@archiver.kernel.org>; Tue, 26 Jul 2022 08:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D746C341D2; Tue, 26 Jul 2022 08:08:03 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44708C341C0
	for <soc@kernel.org>; Tue, 26 Jul 2022 08:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 44708C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id x91so16813059ede.1
        for <soc@kernel.org>; Tue, 26 Jul 2022 01:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oXh48ITjNIZwRpcTgBzMIm7xvCXasMciNKj2nW0FLMk=;
        b=mvC8tzmaF29BiVZk1Z4LrSkhZNsRUiAI03IHsZWdBIGq+21sY3DaehmsTJSCQhOcCN
         IzDXGzhgPtgoo0weSRcw6clQCDiKyzDjc2VJ61GfKnUunLpFcddwo8T6y4Ox+JSjmmlM
         rRS/zZe7jNcqCaJMZPS2EnSOhBXmrGSZNEX2+6RylN3Eol7x+kLzHOv88BK7KXWQuKhD
         6Y28+AUAsiduoBIPGNkUmO4q80A4+6NEPpUn789GXETl2vPl2oVffajX1nEwiKEemX/A
         CFnBBeIN6MVlaE5OyaBVnc/t8xmEv4oY8fLX79lpUZReRbeqET4R87a5u6pdphdVfgZI
         XK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oXh48ITjNIZwRpcTgBzMIm7xvCXasMciNKj2nW0FLMk=;
        b=kREnlU8oTjGsgVHtCdJHviDoaXPz0mgik4gRte9RL5X5tPb/Rt9KbvztDRGgbsK0n+
         +oV0UHuCqGP+tcr3uTulR0gVMDTh+uazDyAyQ/PPZUKvaxdkU5B1+tdb9gqg66YkqRml
         vtnCUiQ+OsJzktElYayDJ3g2CUQNXmqEfakp3et53z013RO4VPAQ/bgoaxvWnMmH4dZ9
         i/IAZ7ofueGWR2+5sE+JchTs0+mdCMED7f2qTqCON9EKkeUbxQ1/MNp3z6M1NJvytB6l
         VG0d4wwgrrcBHOIkrzFo4yboRfBvzKTORmJ+MBGxE+Su/CfwHx4gKQaJJ/6L9ZrwNMft
         fa0g==
X-Gm-Message-State: AJIora/JbLo8lINNr1hmqsqlONGlkXEZFD+i7IOlsYOQAZyzRaUzgfkE
	WGL8BewMRGrScQ2poIbg4X//eXIy4m+SJKyRfccOMw==
X-Google-Smtp-Source: AGRyM1sg7WwfgT30Z5gFgGtBrpzTZYvjI5t68L1TNcWlRC/z4bCNfsLxzmsyxNfNlAgqIwmyyt5i4fpHDXen1zH7g1M=
X-Received: by 2002:a05:6402:2696:b0:43b:eb8b:d0da with SMTP id
 w22-20020a056402269600b0043beb8bd0damr10795013edd.158.1658822880522; Tue, 26
 Jul 2022 01:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220723160513.271692-1-Mr.Bossman075@gmail.com> <20220723160513.271692-11-Mr.Bossman075@gmail.com>
In-Reply-To: <20220723160513.271692-11-Mr.Bossman075@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Jul 2022 10:07:49 +0200
Message-ID: <CACRpkdbNbvKySXPziKHkEfbWknXLdV2L4sb2n1MCR=TSOATEPg@mail.gmail.com>
Subject: Re: [PATCH v5 10/12] ARM: dts: imxrt1170-pinfunc: Add pinctrl binding header
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, robh+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, 
	stefan@agner.ch, daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de, 
	olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, 
	dev@lynxeye.de, marcel.ziswiler@toradex.com, tharvey@gateworks.com, 
	leoyang.li@nxp.com, sebastian.reichel@collabora.com, 
	cniedermaier@dh-electronics.com, clin@suse.com, 
	giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 23, 2022 at 6:05 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Add binding header for i.MXRT1170 pinctrl device tree.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Assuming the rest of the patch set really isn't getting merged for
v5.20 I simply applied this patch to the pin control tree so you have
less stuff to iterate after v5.20-rc1.

Yours,
Linus Walleij
