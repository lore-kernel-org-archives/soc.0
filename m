Return-Path: <SRS0=R+Db=HW=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F39C4332F
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 21:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B1DBC433C9; Mon, 11 Dec 2023 21:02:35 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2E2CC433C8
	for <soc@kernel.org>; Mon, 11 Dec 2023 21:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D2E2CC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5df49931b4eso25463907b3.0
        for <soc@kernel.org>; Mon, 11 Dec 2023 13:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702328553; x=1702933353; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZfsZrrRBlZwfErbKCDlnyMZePAWlHxlE0E9UWOYGmQ=;
        b=BAtPljRpmtEsEYAdHeXa7dqTDJtLgrLUf5flnXbFAiv7bh8VOFRD1zQBsnocUAXEht
         DBetB1yvKas3sf9BEb0jKB5jhYutjZdd7wdboxm7z6VGL4aiC+qE82qFfxGsKJ/HComo
         9MnaIFzPVPn961Ek8aGLbb0wMVWhG+q6tDzlDp+JH/qKc/jB+K4Uf/2NKwMy+95bb0bO
         TfPj19F6WWYjXJGgfqxxkD7iSck6orNOEsSn2A0F7TuqhhoZjTH0zFNzYqucbWM6FoQL
         08BuJc5wc88r4xWAvc77dZkAjurndb4bua/LMAmWCYC9HsAA+kgFoq3JTtn3e6ePnM6V
         16xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702328553; x=1702933353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZfsZrrRBlZwfErbKCDlnyMZePAWlHxlE0E9UWOYGmQ=;
        b=Q/GyiU9WOa2YDikRxvA2m7w9bmPs17U4C+p1LJVE6H9sCaX2bRrjOP5Vjx0YSFu8A0
         I8WbqpFKPGG5QlKusPqYo42nVFXLZVuPjsaY2LP/Rj+S+1yU8KcGXZPsLxzG0j0kT7Xl
         c1a71iIOwkvt5mCCsYzo75UZ0M0f2MGGRp61/HQ6hueiWSgR+KobAVmTEF6xdtxO4S74
         z2qpY3fp44gWtRbgCFm46gcAmlo5SVCT7JvY9gO31ExVkaHCmjnLH9tNqEl+bQWXoG5D
         YdyASJwSsPROsJldPL5gRs4tWmR3apVOJBxVKQqPRbIoCHE3/58hxjtlIvWYNIXnb67f
         ynMA==
X-Gm-Message-State: AOJu0YwHqovbJL0peQuntfTZ247lfljtGJeiAppKLCD0Deeld9NYtALr
	j3APN1Nm9lpcRSZLb/BAqrUVADvJZkVoQqmmzOJ2Ag==
X-Google-Smtp-Source: AGHT+IEx7mNSHR0hv8E+Jx+J+xIQnLDD997azEZuKMXEYCvggtMUMZoyCLaTgxmHG3TvQOqT3+BfMVSbsiM6LZX48/o=
X-Received: by 2002:a0d:f842:0:b0:5d7:1940:b377 with SMTP id
 i63-20020a0df842000000b005d71940b377mr3838384ywf.67.1702328552858; Mon, 11
 Dec 2023 13:02:32 -0800 (PST)
MIME-Version: 1.0
References: <20231211162331.435900-1-peter.griffin@linaro.org> <20231211162331.435900-10-peter.griffin@linaro.org>
In-Reply-To: <20231211162331.435900-10-peter.griffin@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Dec 2023 22:02:21 +0100
Message-ID: <CACRpkda8LJS+9dPQFqQLFDbj=gvJ9rKSu=ECczDB4QUv+FZgnw@mail.gmail.com>
Subject: Re: [PATCH v7 09/16] pinctrl: samsung: Add gs101 SoC pinctrl configuration
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	olof@lixom.net, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	cw00.choi@samsung.com, alim.akhtar@samsung.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, semen.protsenko@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 5:24=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:

> Add support for the pin-controller found on the gs101 SoC used in
> Pixel 6 phones.
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Looks good to me.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I expect Krzysztof to merge this when he feels it is ready and
send to me by pull request.

Yours,
Linus Walleij
