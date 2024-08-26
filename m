Return-Path: <SRS0=zPBE=PZ=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2D0C5321E
	for <soc@archiver.kernel.org>; Mon, 26 Aug 2024 08:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86E1CC8CDE4; Mon, 26 Aug 2024 08:52:16 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A29BC8CDDA
	for <soc@kernel.org>; Mon, 26 Aug 2024 08:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8A29BC8CDDA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5334adf7249so4829166e87.3
        for <soc@kernel.org>; Mon, 26 Aug 2024 01:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724662333; x=1725267133; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLPgq4j7K2LiYLxuRxf5ckNN955ctmmarm/caOOsssA=;
        b=aulQQOf/ZXs/J/cJei93CaHguxEQaOHd7UNfdy3ZcCBW9xWG57rkDQPNMAiGgo1U4Y
         Zt7+U/YrpadRpw5v17VqtkVS/JKFodEXGpIzPNnRpMoNUQ7tJkBR9HtfZW9/lCbKMdAe
         qw7yLJ4m+o/u/BzPkwFOCY5BFeD9OcxkeGMNugHki/Llu4w5b4XEzgLPEEiWCTyfleND
         bc9RuSc8DqhVX0+aDTyDH9yU7QYltS+jVOaX1u351T9/jGkT+DUOTqhHIjgaCreLpAf1
         LhxYxKmEHoTiCXiqQZ4qYnDPgSI48W5NtX2lwkCqt8qH8G67fnzlW5bRuG2O9nXMPwyl
         Upag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724662333; x=1725267133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLPgq4j7K2LiYLxuRxf5ckNN955ctmmarm/caOOsssA=;
        b=BP9XR2mufETiAPJISMfnbRZ5KdAxktdXBeqtevUuiYhk8NgefvJfzdK/g6aMWUv2mz
         B03jQT/6LurYXezY7DAs8n1Q43C9Aa35J3qW1jshgmo5qR+BmKMeoLs/Fx1vQx9hwB69
         VgkTymDb8qvzyWF0F2Gbv+hjKbFU7bebI73QsOhkzDSLWlLJrT59guI75sX84yFAqlZP
         ABN+WAJDWoh+Vjghtc/0DZTDxaarNRDNmPhMmuaH+ERIVSraycQS6z9e/dTaanUyGTvC
         E14j/CpKDEPHr4lTs4xnqBOB9gFha89adMIdxwR7iUXSUCelVUZUdhFlg9n3GZZXfCcr
         6IrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiYnLvg28b/+ir2oGySEek4low7kdu1Ho1SGxgFjt0ZRFJKcMkLyseyd/rS1I+ya3uJJs=@kernel.org
X-Gm-Message-State: AOJu0YzkSM7sxUGtbrJfnJHpgo+1/v1yazJPUgslH/DY+5fwgp0kZP7P
	2GCBopr582lO6xMtZaC/NSeXkrTBok5mn8JOMdaJC0BFTukjGuyF1/w1BvrqONMypMuHOjJEyEm
	W2nhnTRT1dl0pWJGkuvGsuW0pJM2cQSvP8HFwNg==
X-Google-Smtp-Source: AGHT+IHdurCu1h8I5sDDWlcStXgFvab4u4dfQ3BDVkKhxSBCdaAQCimGjSbIMIoVyf3zCgPHH//JMjG8dg09AgOyRLc=
X-Received: by 2002:a05:6512:334d:b0:534:375f:97de with SMTP id
 2adb3069b0e04-534387bdfc1mr4983010e87.58.1724662333113; Mon, 26 Aug 2024
 01:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
 <CACRpkdYFc8vuz__7DkFSMFxUC=LSwCJmEun2KXgUvPMq+_e17A@mail.gmail.com> <ZsiygIj9SiP4O0OM@google.com>
In-Reply-To: <ZsiygIj9SiP4O0OM@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 10:52:02 +0200
Message-ID: <CACRpkdZ_y=2WKCLwi5or-=MasvNw2bcxht6a+bFjV=yAfvQhdQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Remove support for platform data from matrix keypad driver
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 6:02=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> I'm glad that we agree that we do not want the elaborate merge process
> and instead push the changes through one tree in one shot we just need
> to decide which one - soc or input. I am fine with using either.

I'm also fine with either, but let's take the input tree because the
you're in direct control of it so it will be easier.

Yours,
Linus Walleij
