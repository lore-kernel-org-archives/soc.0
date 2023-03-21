Return-Path: <SRS0=HsGY=7N=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4FAC74A5B
	for <soc@archiver.kernel.org>; Tue, 21 Mar 2023 11:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91EBEC4339B; Tue, 21 Mar 2023 11:21:53 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC9E8C433D2
	for <soc@kernel.org>; Tue, 21 Mar 2023 11:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EC9E8C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-yb1-f175.google.com with SMTP id p203so16554030ybb.13
        for <soc@kernel.org>; Tue, 21 Mar 2023 04:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1679397711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N+KqRWhaDx1aJoI/pna5di6cHpQDQbH5Dv0l0ZgDy3g=;
        b=KVoWmCl3lAefXbSjr1XFa+Pxr15fcLxSACIYq0vUNsPKheJwN9PLuMYI4g/xhAjlJR
         v5jPl4mNRlohMGFK3j609Jd1v1JyoCHAGE8WkQQir9p+3GVucIAu8ajbJPbJJzf9oW5i
         f3VlU0/OrWyyNLnaKLuJr/QQ4ZmnEnZCIWWmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679397711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+KqRWhaDx1aJoI/pna5di6cHpQDQbH5Dv0l0ZgDy3g=;
        b=edD5veRq/KOeHiNFX63z/lsuzc4vS4Ysc49Ej5Xj7D2s5Wpix7ihH70Z8MoIydlIXS
         g6qMPJqeY1yN+csneozVG4BYSivjwVh8mWa/m/CiSliEATOT3wu98m0ZtLj/Brr+2SMY
         VQC/9pW8qJcghEyYh9QlC7zoKMZAiLlUEwQdvcOfGSoLNofoN1FW/IhgVJWzQVBw+U0L
         meWX2/kQ3l9Li2Mh/fbU1Kei79EHwWyidHRq+hmtEXnipg/gbMMo674ch76dKvGdTX1U
         eH7kKeIZbQSlklApA9s7DXU7vRmfqNIxh3hTKW+HyxPfdJeeSAHx0z7K6OpM+u3yNqdF
         qbXA==
X-Gm-Message-State: AAQBX9cpW9bYL9vAlif7WtCkfmUtbM6wnf0nOnpFzGjxhFhNKzl8ESv6
	XkSJ5oyS+L8De9n+qNExf3sEQCYS0NxQEGo9MRuOGA==
X-Google-Smtp-Source: AKy350aGC8yl/vUvR9z4Vm7doUX9SkLJ6MUp8qgSDNHNEIcIwszPmP7Z6Gr3qL15c7ncubDyIJlOLnYGFNkZU0VIB/s=
X-Received: by 2002:a05:6902:283:b0:b6e:d788:eba7 with SMTP id
 v3-20020a056902028300b00b6ed788eba7mr1159105ybh.6.1679397710763; Tue, 21 Mar
 2023 04:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230321033810.22017-1-lukas.bulwahn@gmail.com>
 <CAFr9PXmKsequA3V7QWC2fKQYZgaNRj+q3q=UOBLmg6wxYKiVYg@mail.gmail.com> <59c05b36-3370-4d7b-b8cc-39d6dc36cdd0@app.fastmail.com>
In-Reply-To: <59c05b36-3370-4d7b-b8cc-39d6dc36cdd0@app.fastmail.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Tue, 21 Mar 2023 20:21:40 +0900
Message-ID: <CAFr9PX=5Xj63Fm2nRa8oPdXbrkKOMG7D1Y_EV361HtYjs7GZaQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: mstar: remove unused config MACH_MERCURY
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Romain Perier <romain.perier@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Tue, 21 Mar 2023 at 18:30, Arnd Bergmann <arnd@arndb.de> wrote:
> I'd still prefer removing it now and only bringing it
> back when you actually add the code for it.

Fair enough. Code does exist for it in my tree but I never got around
to sending it.

I rescind my nak.

Cheers,

Daniel
