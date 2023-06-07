Return-Path: <SRS0=8NtC=B3=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE09CC7EE43
	for <soc@archiver.kernel.org>; Wed,  7 Jun 2023 06:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9F5E0C4339B; Wed,  7 Jun 2023 06:54:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93D08C433D2
	for <soc@kernel.org>; Wed,  7 Jun 2023 06:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 93D08C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f6e1394060so58613955e9.3
        for <soc@kernel.org>; Tue, 06 Jun 2023 23:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686120842; x=1688712842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlTH0flV9TBNUS7zdW2i6f3cA5YTTh8BFjhhvW+dIpM=;
        b=Rt30GKY69Mh+6r4StJU5NjbV6KeMtlHKUzAmLJbFN+w9biF4q2rqFNQyFgCL+9MCoE
         VTEUyWnlWgL4Gwfca/v927xpgm+wD19qMAgIOe4Xht4rnFVL12/6ZbxEydSUkGb35mVm
         y3PTdOFOUkwHNljaEJtOfL1SvoHfYBBTZeufh+A7TEzBM0EIOM/hl8z+arNncBCSKRER
         /8P0PVvq7r5X0/reS58QVYZGWNmsbhi9gZfhGX4LQKhyqQk/S+bjfcPIr0ocN4BusZEi
         GFQUXZRHRtEHAJUi2XkEoI9vRwZFAiJ3GNKtYe12yifOOFmuMLtkMk1/7QjkRkBomu9b
         fEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686120842; x=1688712842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlTH0flV9TBNUS7zdW2i6f3cA5YTTh8BFjhhvW+dIpM=;
        b=XLvNQ6owbwZnlQ98F27uCx/mQaa3uJzvP/BkicFfzs5SsnKQWeCdf05fhYVcrorMLt
         U8DTock9orr7zX74slNUnqTVhMgLx/o0Jox0wONdYLqMp4L2PVQG6ZSN4fXEDyJvfaez
         17bL2KszkZj0Ckh8YasWf0y8WbOSO+J9taTIQ28fr/TTBT9HfSsidg44CeIWYGM8wCbh
         FiboEqymYJMM648tGZ3yFdWi+BYSbWLo5p8Hy684FZ05D9a6feS/dVEdfBC9HYyH7uCX
         b0AASHOmTJwL/6JUB0f/Prq/Jwormijqj5TJYUiN8S8SJnAGbN/vtv3r9Arav4OFS9Cp
         cQvQ==
X-Gm-Message-State: AC+VfDxTSbG8u7mLxei2ww+PGWZ2mQ924wmHEabW8Tm9C9lSgF1hW0Q9
	Eidi+hZ53LQyuA6h4Om1ot0CpNBU7F+4HrIxTkCTaQ==
X-Google-Smtp-Source: ACHHUZ4arNb7UsrHj7mKJUYLXzNLWENDHyn7YEoqczSE7WZcrL8XedzE3jpTlbwWWeZMbZL6fPbEO00LdO61g9BlqTA=
X-Received: by 2002:a7b:c3c9:0:b0:3f7:3526:d96f with SMTP id
 t9-20020a7bc3c9000000b003f73526d96fmr3841067wmj.27.1686120842531; Tue, 06 Jun
 2023 23:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230606075843.GA2792442@rayden> <0fac8e65-fe05-4dbf-a634-4620f764e2bd@app.fastmail.com>
In-Reply-To: <0fac8e65-fe05-4dbf-a634-4620f764e2bd@app.fastmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 7 Jun 2023 08:53:51 +0200
Message-ID: <CAHUa44E5RjMqeTp1Sr_7=Eavu3T+q2YVg-V-_gLWpO5sjJ-Vhg@mail.gmail.com>
Subject: Re: [GIT PULL] AMDTEE fix for v6.5
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: arm <arm@kernel.org>, soc@kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Tue, Jun 6, 2023 at 1:47=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Jun 6, 2023, at 09:58, Jens Wiklander wrote:
> > Hello arm-soc maintainers,
> >
> > Please pull this AMDTEE driver fix to add a return origin field to the
> > struct tee_cmd_load_ta used when loading a Trusted Application into the
> > AMDTEE. This change is backward compatible.
> >
> > Note that this isn't a usual Arm driver update. This targets AMD instea=
d,
> > but is part of the TEE subsystem.
> >
> > Thanks,
> > Jens
> >
> > The following changes since commit f1fcbaa18b28dec10281551dfe6ed3a3ed80=
e3d6:
> >
> >   Linux 6.4-rc2 (2023-05-14 12:51:40 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://git.linaro.org/people/jens.wiklander/linux-tee.git
> > tags/amdtee-fix-for-v6.5
> >
> > for you to fetch changes up to 436eeae0411acdfc54521ddea80ee76d4ae8a7ea=
:
>
> I see there is only one patch here, and it is marked as 'Cc: stable',
> so I assume  you meant this to be include in v6.4, not 6.5. Can you
> confirm that?

If you don't mind taking it for v6.4 that's even better.

Thanks,
Jens

>
>      Arnd
