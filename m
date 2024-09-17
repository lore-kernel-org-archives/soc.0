Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A200C35FF3
	for <soc@archiver.kernel.org>; Tue, 17 Sep 2024 08:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 648CDC4CECE; Tue, 17 Sep 2024 08:46:38 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 21F6EC4CEC6
	for <soc@kernel.org>; Tue, 17 Sep 2024 08:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 21F6EC4CEC6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f75de9a503so56514101fa.0
        for <soc@kernel.org>; Tue, 17 Sep 2024 01:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1726562795; x=1727167595; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aJBhudlylQx20T8DaheWHIktldjYtmdayChYHIL8RnQ=;
        b=SvD0XH8vdsosFBqJPqzIpHU6SrCS8VDj8OVtAL08A6PEPVVkDo3eRNh1BSLi4aEDFz
         tbLRYhmpoPEunUuBSXFfzcHdPa5BfTSu9PyIlrd4XUSe3nKD7mHtXGvpyEe/MYT25u6F
         JKH0VO9wXvlV49nMOmbihPB0PNvPt6qsxpr7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726562795; x=1727167595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJBhudlylQx20T8DaheWHIktldjYtmdayChYHIL8RnQ=;
        b=JZLuS6FexXQQLz4NLUW94rHppPACtaA2G+DoPqfM+KAeDXDlbpbSZRURo2iuJ1rb8q
         HIpQ6OxGDp/Rt4l5AfE+aPZZSK/bC+mZFwGESxwARr3xfBfNcHZbASDADITMhCQpvpU1
         XCDEp56IeWFCLbeWk+e2P81Fo2kdMzVbybrUX/djWULNJgsUiVVXsceG5+SMExrAotYY
         RcB69Ai0vEE/eocSgphIJpGpQ4Z/IsBxOQiHaItXyw7jSvzz9hSqVdLTkI7SLJVHxZSB
         4CwqJmsG0BsjSk6svinKsD0mXfHtxgbAVbtsE9ohqMRYmNfwU09xTX8oy2+PdjYyNv3e
         uRow==
X-Gm-Message-State: AOJu0YyfgyAcDarQu9kxbqAADm7owuC8aom3FKK5sSLeyr0tnZxeGWaz
	eQCLEYWO1tU0LBGTS+LyvN4EKX15hCcDkYiyhA8nTGGx4aLDYmBNpdB1BVcpbA6fgmh5jT9GIJy
	QtDf2Bg==
X-Google-Smtp-Source: AGHT+IFQ9KCH3l433iO41hzF2zrUGpOaufs++YFyk72piW+9FQAsTEkEgeG2ngg+yF4XRk2D2XYi0Q==
X-Received: by 2002:a2e:711:0:b0:2ef:2d3a:e70a with SMTP id 38308e7fff4ca-2f787dc855cmr61668311fa.18.1726562794669;
        Tue, 17 Sep 2024 01:46:34 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d485f2csm10320961fa.115.2024.09.17.01.46.33
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2024 01:46:33 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f759688444so45420991fa.1
        for <soc@kernel.org>; Tue, 17 Sep 2024 01:46:33 -0700 (PDT)
X-Received: by 2002:a05:651c:b06:b0:2f3:fae3:83a7 with SMTP id
 38308e7fff4ca-2f787f58477mr91757961fa.43.1726562792876; Tue, 17 Sep 2024
 01:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <a40b4b3a-5d61-4bef-b367-745ba058be9e@app.fastmail.com> <212ba952-faee-42f8-959d-c2a8d3dc89a7@app.fastmail.com>
In-Reply-To: <212ba952-faee-42f8-959d-c2a8d3dc89a7@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Sep 2024 10:46:15 +0200
X-Gmail-Original-Message-ID: <CAHk-=wh3C2F3aO+Ky8CUQDM7+tUSxkCRRCVcLH+yuhaLoao=vg@mail.gmail.com>
Message-ID: <CAHk-=wh3C2F3aO+Ky8CUQDM7+tUSxkCRRCVcLH+yuhaLoao=vg@mail.gmail.com>
Subject: Re: [GIT PULL 1/4] soc: devicetree updates for 6.12
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Sept 2024 at 18:32, Arnd Bergmann <arnd@arndb.de> wrote:
>
> soc: devicetree updates for 6.12

Yes, the diffstat is large, but I'd still have liked to see it as part
of the pull request...

Your other pull requests do seem to have it, but this was missing it.

            Linus
