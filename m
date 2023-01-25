Return-Path: <SRS0=cWTr=5W=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803F1C54EED
	for <soc@archiver.kernel.org>; Wed, 25 Jan 2023 22:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D60CC4339B; Wed, 25 Jan 2023 22:18:31 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7E3FC433EF
	for <soc@kernel.org>; Wed, 25 Jan 2023 22:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B7E3FC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 188so24922683ybi.9
        for <soc@kernel.org>; Wed, 25 Jan 2023 14:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NPUDVfqEJt2h95Y7BrdphbvzHEg2RST78ad60z/MiSQ=;
        b=K0pxYi/XN90ABinCFtZV7WOOIeZ3IoDWHGgF68JOIk13dkBd7dPk3VIzbyX7Ni81sp
         qOZLML6MfFc1bmsLm42q5cQENx9M2D01LJ2lEUuvJWNGsZacNF7cvj2bHa7HDEJuiDYm
         etYfQIlkI4qYyhksZp6FJ6x9j3v+afdvGhdU4Cs4oeyJSoaSG6/qgwwd3D8GA7exolmc
         klIlYwUbOVwVLe6dHd/Fu4YTRfEUQ6PjaJ4W0hxwmUk44u3hw/5CNkiz6UZ2JYXTn+0a
         8FXPgoFq1UlDdg3a1E+P+V+CR/WUX567LWlpjhWlGWtkKuHLDLmdN+Uoiblxfu96k0Gj
         Ax7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPUDVfqEJt2h95Y7BrdphbvzHEg2RST78ad60z/MiSQ=;
        b=XkvwUkf2+bhC5MU+B9QbFQel1Af9Fpl9susWgodKb93NJSMyo2GsYdRKtcfUpv0eJY
         CIcBEtPawT+2ZRpbQ4Cc9bQRfyLRqO8W0/E5r9q6m+lyB9Lvt1leFb0DiTUyFF38dnRA
         WPix5ovYp14bmeyfbXcprti/JG8Dcr3HmbqeRKYqfPLKDwK1pMOueqdHatKlBnAWzTrT
         HIyP5NCn2e9CR04+WKQ8iLkhAxWYPejCqKE+3Y2tawgerhCnjMwkfdC22DhcpVgmowN1
         aXZGZBsjgCYhL9Lmft31IIcNtAFR6u+bQAsKQUxoWhO0iM6OxK+ROZweIjGIVhWXFWJv
         y2Kg==
X-Gm-Message-State: AFqh2kp6ENacpZIZOpafitJg2jSR54W2QNtAHCuQ7TTqilsTneI+k0BW
	aMD/pGXb95xl9fjZTETnqEgMYvsvZ16V8p/FjGPPGUOkU6IK/zxC
X-Google-Smtp-Source: AMrXdXvYSMeMl4cIzOurSi8I/JB/DKI7You1N7wR9K1HhHhAeUKskJGDgOHJbJa6p76K11IA8xHvH1okJfaspOwbe18=
X-Received: by 2002:a5b:38b:0:b0:7ca:9b40:72a7 with SMTP id
 k11-20020a5b038b000000b007ca9b4072a7mr4161015ybp.130.1674685108577; Wed, 25
 Jan 2023 14:18:28 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdY24Lv0F3ct2R6ALPpAdxWz_vEjrPAGNSF3pcoOj-Xqcg@mail.gmail.com>
In-Reply-To: <CACRpkdY24Lv0F3ct2R6ALPpAdxWz_vEjrPAGNSF3pcoOj-Xqcg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 25 Jan 2023 23:18:17 +0100
Message-ID: <CACRpkdZVH8nu=4a4MuQZ=uUpqg1MBXShCU_Bm3CUxPg1adO8BA@mail.gmail.com>
Subject: Re: [GIT PULL] Ux500 DTS updates
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Wait!

On Wed, Jan 25, 2023 at 10:43 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> Linus Walleij (2):
>       ARM: dts: ux500: Add eSRAM to the device tree

Now I see there is an appropriate "mmi-sram" binding in
Documentation/devicetree/bindings/sram/sram.yaml

That's obviously what I should be using for this.

I took it out and pushed the same tag without this patch.

Yours,
Linus Walleij
