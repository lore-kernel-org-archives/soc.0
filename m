Return-Path: <SRS0=eUyo=QE=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1686C54FC6
	for <soc@archiver.kernel.org>; Fri,  6 Sep 2024 05:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB065C4CEC6; Fri,  6 Sep 2024 05:24:25 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0C22C4CEC4
	for <soc@kernel.org>; Fri,  6 Sep 2024 05:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0C22C4CEC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-277c28fac92so1540318fac.3
        for <soc@kernel.org>; Thu, 05 Sep 2024 22:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725600264; x=1726205064; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g0hUiLACmrvnz1yXtrSQ1wQ/roWbnuIi1O6fdmIhG60=;
        b=d4CuLjA9k3lKw08O0mkuZ44gWpZkXmDrED+iqISNpnqbDfPeNvX2VOReAZo19tiWVZ
         Fyizhv7OJV/tr72ud4FlD7tNCpJnpU3E/EQviC4yFl3zmyGPXIONjomRjO85SYlDfw3b
         eW/d/VufMCdXBpxgqx5FZZKAqHGMx4L6y0bz5CVq816OCKVLrKEg6nwC5DaL+qk4bna1
         RKHQGLyyvxQqA3pEd72UlNIbBotzsdCNniK/84XU10SqxEjzTBAcMd/0IduAXwZOu+vG
         +KjvG2gV4zNg4Bv40YqRhuK2QDYJK3CwUzkcPJ+YEtgKTrYPmRJkpu4ps+lwjO3u0s/s
         MqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725600264; x=1726205064;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0hUiLACmrvnz1yXtrSQ1wQ/roWbnuIi1O6fdmIhG60=;
        b=l5XkmkkA6Fr5s2CcMo88r1lvKUyjzwgKHs49y+UmDJvnmpw1e5/OQw9ZKAv6Nejkus
         7qniPps+giHh5B2PJbIin2/oIBRE/0uwCYu0NnjwwTU77hl7/X8tsu2S3UX2ugqafzSk
         JZMmzPdKWGx3iJxSAHW64drA87LJQ6HmLWDu+VyNoW9Le8w8Z+fnEjF6PbpKU6qMc+FD
         IfuQX4wz89fHlw2tRf7milXgdCzrtGN0Ge8j/GvZeeH/zO/a6Hl8H6/SD08qj3hJHHod
         73k9ngxSiFh52EhUppxtQGa7wxePUof2KUHhbpY3fmOAAuRRmmxpPRly/rprj1KBEYsQ
         3Tzw==
X-Forwarded-Encrypted: i=1; AJvYcCVHTm/xtR1TWh6P9mV67oKnelQB1xqT5nPD/Gpd/48fOtWKP54zJXcShW5np0v3b8/KPxY=@kernel.org
X-Gm-Message-State: AOJu0YzCwp7Bxm3/vBF/lgvVmbGDewjuEQ0ZaYGj5IY6/opdo1udP4UZ
	kMebEuoiMUcqujxPa++sw8WaAFDWxoL4YekokXJvUTJgcW8GM+aj
X-Google-Smtp-Source: AGHT+IGdYz//gUlPTOdJCgjsgIKN0yi8MM4ZuYXDy4L3MaGfGGYtupsSkoRabCZzG9XrbLK7/cYsYw==
X-Received: by 2002:a05:6870:9111:b0:25e:940:e934 with SMTP id 586e51a60fabf-27b8302d160mr1610491fac.47.1725600263547;
        Thu, 05 Sep 2024 22:24:23 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1de8:3062:3230:1a45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778520e83sm4080229b3a.42.2024.09.05.22.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 22:24:23 -0700 (PDT)
Date: Thu, 5 Sep 2024 22:24:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 0/5] Remove support for platform data from matrix keypad
 driver
Message-ID: <ZtqSBLDeClX9Bq3U@google.com>
References: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
 <CACRpkdYFc8vuz__7DkFSMFxUC=LSwCJmEun2KXgUvPMq+_e17A@mail.gmail.com>
 <ZsiygIj9SiP4O0OM@google.com>
 <CACRpkdZ_y=2WKCLwi5or-=MasvNw2bcxht6a+bFjV=yAfvQhdQ@mail.gmail.com>
 <513f718b-b964-4af1-9c51-9e0ba3809225@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <513f718b-b964-4af1-9c51-9e0ba3809225@app.fastmail.com>

On Thu, Sep 05, 2024 at 02:36:15PM +0000, Arnd Bergmann wrote:
> On Mon, Aug 26, 2024, at 08:52, Linus Walleij wrote:
> > On Fri, Aug 23, 2024 at 6:02 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> >
> >> I'm glad that we agree that we do not want the elaborate merge process
> >> and instead push the changes through one tree in one shot we just need
> >> to decide which one - soc or input. I am fine with using either.
> >
> > I'm also fine with either, but let's take the input tree because the
> > you're in direct control of it so it will be easier.
> 
> Sorry I dropped the ball here, I just saw that these five patches
> are still in the patchwork waiting for me to apply them.
> 
> I'm also happy for them to go through the input tree, and have
> marked them as not-for-us in patchwork now. Dmitry, please add
> my
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> and pick them up in your tree. I've checked that there are no
> conflicts against contents of the SoC tree. If you prefer me to
> pick them up after all, that is also fine, but please resend in
> that case.

I made an immutable branch off of 6.11-rc6 with the changesi and merged
it into my 'next' branch for the upcoming merge window. Please feel free
to also pull it - it does not have any unrelated changes:

	git pull git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git ib/6.11-rc6-matrix-keypad-spitz

Thanks.

-- 
Dmitry
