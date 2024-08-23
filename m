Return-Path: <SRS0=TOSu=PW=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A399C52D7C
	for <soc@archiver.kernel.org>; Fri, 23 Aug 2024 16:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06DFAC4AF09; Fri, 23 Aug 2024 16:02:14 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0187AC32786
	for <soc@kernel.org>; Fri, 23 Aug 2024 16:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0187AC32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2d3b5f2f621so1588821a91.1
        for <soc@kernel.org>; Fri, 23 Aug 2024 09:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724428932; x=1725033732; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSEc8IuLgrEwWAM8+Mg+yV+OINf+nUjNczzsNR2PhoI=;
        b=cZK0V+V0veA/v1qhsqolJWoSQf9jJe5KeXihR+5PTmo0+v3X7DtNdju/UvMyNBnLVH
         EEel9cgo+AwHBEyikhpCY+6TJLRiky7RJtHyY4cNMMYuqa4ympfWoLoy5+DUTjQX5MWo
         bBJKAH8By4U45qCnEHZ3Bfj0tEDQjhnvMQcC0/rd3AmEA241CxVfT86Hw9p1FwhNsFSK
         fACK6qPtWzbNWKB1QTglu4MrF/8iAEeXXr5OMp1qTL9308PWhpEFJZVIRlWJZbaNMh3g
         m5OAY/hTUEIaZxDoVObXInZhX8eP0FEoYhRICbCrf4czdadmdIJ6569lGqHrF0ZkZLVz
         YVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724428932; x=1725033732;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rSEc8IuLgrEwWAM8+Mg+yV+OINf+nUjNczzsNR2PhoI=;
        b=C459WG/vApDSpx7Cx+zesjUk5LxHANCAgMDOYnqyG394hU/3mHW2UyYrMyly/9JedR
         4aPiZb2aZlgvUdUpyYlQUJsdvnj3bybniCZimf4PQA04srmz19K2pk14B9spI2lGO80h
         dZTfRvmDS+Hz6NNg01mueKLPz2DSeM4SyKYQtkI+1r6HVPuBXz19AJ/zaHRCLyM1gYan
         f8bQGIVcuUcYeZlG9rD0gTbBfsBxx4BOt8iDdWY2yvabBEtdN9OIL7AFYb0qU+G+67Kt
         vNLq6aoaUBlyxqN6+3XCWrv7p3J+hyL8dToUf472Gfzjvw7UpfED8OzleHG9bHTA3eSV
         /ttw==
X-Forwarded-Encrypted: i=1; AJvYcCWZYPL/YujPgokTLxPTUX3yNFmoCMx26OHE+NVnp+MRPJHBKBaoRK78w+ygGtz5pr2NqVo=@kernel.org
X-Gm-Message-State: AOJu0YxDsipPNBgLVU5kQoSQkWiThfAX4Se6uAvl3UfpXkjA9RWMFEYJ
	0nUjWJBr4tu3fZ7gKLvmlRtA0B70VDZouKFvE768fo3lITrpOe9ZQdafew==
X-Google-Smtp-Source: AGHT+IFm9bfhV0E2ppaQ2w4WAd8hdG2KagFxE0sirDEjgyyoq1tgA2ruqzLgtHrDzAQMHCSgozUvnw==
X-Received: by 2002:a17:90a:680f:b0:2d6:1c0f:fea6 with SMTP id 98e67ed59e1d1-2d646bad283mr2408625a91.11.1724428931106;
        Fri, 23 Aug 2024 09:02:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb90c4c1sm6595170a91.19.2024.08.23.09.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 09:02:10 -0700 (PDT)
Date: Fri, 23 Aug 2024 09:02:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 0/5] Remove support for platform data from matrix keypad
 driver
Message-ID: <ZsiygIj9SiP4O0OM@google.com>
References: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
 <CACRpkdYFc8vuz__7DkFSMFxUC=LSwCJmEun2KXgUvPMq+_e17A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYFc8vuz__7DkFSMFxUC=LSwCJmEun2KXgUvPMq+_e17A@mail.gmail.com>

Hi Linus,

On Fri, Aug 23, 2024 at 05:51:30PM +0200, Linus Walleij wrote:
> On Mon, Aug 5, 2024 at 3:47 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > This series attempts to remove support for platform data from
> > matrix_keypad driver, and have it use generic device properties only
> > for the keypad configuration. Spitz is the only board [left] that
> > uses platform data.
> >
> > As part of the migration I am also dropping support for "clustered"
> > interrupt mode, as it was only available through platform data and there
> > are no users of it in the mainline kernel.
> >
> > Additionally gpio-keys device used by Spitz converted to use device
> > properties instead of platform data.
> >
> > I would prefer not to have the song and dance of merging first 2 patches
> > through the input tree, waiting, merging the spitz patches through SoC
> > tree, waiting, and finally merging the last patch to matrix keypad
> > through input again, so maybe we could merge it all through SoC?
> > Alternatively, I could merge everything through input. What do you
> > think?
> 
> Sounds like a plan. The series:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

I'm glad that we agree that we do not want the elaborate merge process
and instead push the changes through one tree in one shot we just need
to decide which one - soc or input. I am fine with using either.

Sorry if I am being obtuse.

Thanks.

-- 
Dmitry
