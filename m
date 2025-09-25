Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315A284039
	for <soc@lists.linux.dev>; Thu, 25 Sep 2025 07:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758784638; cv=none; b=hcY+WCt1C9m4VvjonPkCHaUnab5pr+FvmtYVZA+S8cra1Pq+Bg9eHBbcPxKvsVVQvrDolWmi9kAaQ2PQzqvz4uduyMUd9NxWeHjaXcnvd66PCfqyFJNcCRoicauFxRtiX31VxBXqAqBRbCzaWy200IU3nhF9eGW5H1cFTHbllf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758784638; c=relaxed/simple;
	bh=6GVENq/k9h7/EvFAsH73JEtGioL2OOL2HZi4Wy6wl0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZwnKOYR80M0pYiB6fJHWSub5R80T1J9MJw3rMVmUV2zyUP2BXMDZQXZGtXE7AGOdXwx1vqM3hdHztlTWSnFBo3H9J4xXxIHxt3psmIZYQ+zVy0ZIrQjckz0wuHIZp4LgPoouev/bAlrlCJ2TMfKNqIyAG1JF+Fms+BxPtUHilfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zhZ4F6yg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zhZ4F6yg"
Received: by smtp.kernel.org (Postfix)
	id C3C8FC4CEF7; Thu, 25 Sep 2025 07:17:17 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CE797C4CEF0
	for <soc@kernel.org>; Thu, 25 Sep 2025 07:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CE797C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-30ccea8a199so473362fac.2
        for <soc@kernel.org>; Thu, 25 Sep 2025 00:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758784635; x=1759389435; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMHhGG8yDDZuE0c3SXXHFpV2/qh92s5YSG1CuMfLsL4=;
        b=zhZ4F6ygKE57/CR+xJOeWsZAt55zn5Kw9M0aJ9xVWlaeX938oXkMzwKrMv9os76bqD
         NZ+MMtpQBvAyFH1kW+0xLuoCQZ0KFN4hA8MiMQ0WlAaqX/W4RDVFceSZpqYB5EBJv6sx
         yS8IEFN1299j/HhzB5LIbbyVcDe5jWj7x1V01EGcqXJawppfAU1HAGLnCVloI3f0cdt1
         C1mCN0a73VMF5jj3VmOFhYEtM0F4vV+Q2xwbcjqImYMGYQWGOOlnf0nuROo2bUmtW7Uk
         tvpm2bLZ1xwq0/6QQ5gdIDThK4zseuKFnG7Y/qsVUJGob4Cf5mJWL4fhqV4dPXo+yVhk
         5bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758784635; x=1759389435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMHhGG8yDDZuE0c3SXXHFpV2/qh92s5YSG1CuMfLsL4=;
        b=NxX2yfiZVXt5NAi39scP8dEC8XRJW4DpIO6WbhbvT0B/pQxdAJ58Qn0jYgqaO35Onr
         Lx8ENgXzyW/T7fai8V/jIkcsBdimy/NJg2pk+Bwsp+Vz66hd5/XyDg+vKtTF/Cjh5IS1
         DLDFf6o0DnYHKNiQE60QZ4hIkZeSXdf2JtpnpUKyyxUvHyHDHrlnS6O4hw0AWCDz/Xf/
         Aa5kRtFiPUeh4kvblwULc9BvvNiQvuGLCsJjTbdq5SHBlxmuwhc5VEP6PR2XN49U9ytf
         Iocv2KGcEEX9CvMhCHiqPd3jz8yvHGfBV73mbr+yw/jUZUmqFs8sayvB6kIH8k3+deNI
         s5eg==
X-Gm-Message-State: AOJu0YwauzXkXUXu0+Ed8IBSVNM8oF6MKbuVbRSIQfmfuHl0QelPC0ue
	oaZ9pAkqL04U8uMwm/Ij3QzrNgmywdncBEtiKDpYrgl8amQN/OymBgJa/mLc2kHEjjObOkWSg6l
	/xWwBjrUXb7VhcrToiiKGCDmsLgHWqn0sF6c9QFCEvEz6kDNtz2dZXFnQlQ==
X-Gm-Gg: ASbGnctTEA7kCuUeXqFsRR8Op7nDFoRM83po2+qUkq9pygsNrNiqbapY0j6HksgbgPX
	BjA+XfZEUb5KU8wGo4fKbPOJO1L1PQpaDvt5soOL+XCVQQxEH9wndcz49SHDuJty73eUZGU3Hmp
	UUA63SouWSRkmoYG7bSALhp87haWOtUBhZvBF2/1tb89Obw3gYWHe9snIIxZg6bja639bkJCOIN
	ehhm+up
X-Google-Smtp-Source: AGHT+IGSfNdXw9ilvVhBUnW3lwHsR2QZGLh2w5oSAXEm8kT8FRxIbNyBnlzOqe2SycTTqeovZhUNaunBo8UvL5YSGU8=
X-Received: by 2002:a05:6871:823:b0:31d:8e95:2f0d with SMTP id
 586e51a60fabf-35ebec33df3mr1472705fac.2.1758784634761; Thu, 25 Sep 2025
 00:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250924083404.GA3747732@rayden> <175875181113.2716298.16465530311161198160.git-patchwork-notify@kernel.org>
 <4ef734e5-283e-4bc4-84fe-bb6241c69942@app.fastmail.com>
In-Reply-To: <4ef734e5-283e-4bc4-84fe-bb6241c69942@app.fastmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 25 Sep 2025 09:17:02 +0200
X-Gm-Features: AS18NWA6vKhg-O43MYrx6lKpU1521TILZc1zYhWLBecV0Xdq-xuxQ5AOBpa_oTc
Message-ID: <CAHUa44HNcNkuX8e_cuXiz1Qw8Qte93U4tsGM9meE_A7oSdgMTA@mail.gmail.com>
Subject: Re: [GIT PULL] TEE fix2 for v6.17
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Thu, Sep 25, 2025 at 8:45=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Thu, Sep 25, 2025, at 00:10, patchwork-bot+linux-soc@kernel.org wrote:
> > Hello:
> >
> > This pull request was applied to soc/soc.git (for-next)
> > by Arnd Bergmann <arnd@arndb.de>:
> >
> > On Wed, 24 Sep 2025 10:34:04 +0200 you wrote:
> >> Hello arm-soc maintainers,
> >>
> >> Please pull this fix in the TEE subsystem.
>
> Hi Jens,
>
> I saw this just after I sent what I expected to be my final
> pull request for 6.17, and that is now merged.
>
> I applied it for 6.18 for now as it appears that this is
> not a recent regressen, but I could still send another
> pull request with just this one patch if you think it's
> urgent enough. Can you clarify whether the NULL pointer
> reference that gets fixed here can normally only be triggered
> by root-owned processes or also by normal users?

It can also be triggered by normal users if they can open the tee
device. It's expected that users who need to open the tee device
belong to a special tee-client group or such. This is what it looks
like in our test setup:
$ id
uid=3D102(test) gid=3D104(test) groups=3D103(teeclnt),104(test)
$ ls -l /dev/tee*
crw-rw----    1 root     teeclnt   245,   0 Sep 25 06:49 /dev/tee0
crw-rw----    1 root     tee       245,  16 Sep 25 06:49 /dev/teepriv0

Where the test user has enough permissions to run the test suite.

I don't think it's that urgent.

Cheers,
Jens
