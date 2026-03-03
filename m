Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E35738C2C2
	for <soc@lists.linux.dev>; Tue,  3 Mar 2026 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531517; cv=none; b=s4EWw5fa2+p1mu2xhaHp6yHKXdX5kRhWDruIC00fXeCOlW3Q2iGe2Sms6INLEv1kG9L7JF2NEvmUpEpK+sLNAfQVDjIHja2S5hPx/9H1cBSEZCXUdFOTZjMeX782QLU+E3bHI9aRqntb5QjqfMSkbBp3jHepHceA5yx93NNMbgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531517; c=relaxed/simple;
	bh=XalzPg49RXPyVEL2vPgmeWZTYucUbBJT1qg2QsW/c+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+otE4+G+7SMqhg/RpXIj0mne5Iv0sfy+p33Ep/TMnOZ6iZUxC4cKMoSnBwya1RV9LgEv8ZEdtglNYnfSZUGrfSD6oU/KXPoqWa1SUwKcBEnvvvmG62SFdV3rz3/Ive7eLZ2kIg4PW8KoMzG4LETfbP2zNoEV2mJT/I3Yi+hXSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GoH7joOC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GoH7joOC"
Received: by smtp.kernel.org (Postfix)
	id 27F40C2BC87; Tue,  3 Mar 2026 09:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1293DC2BCAF
	for <soc@kernel.org>; Tue,  3 Mar 2026 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772531517;
	bh=XalzPg49RXPyVEL2vPgmeWZTYucUbBJT1qg2QsW/c+8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GoH7joOCySk24GfJYOEUgPCGWouI/vwOX6grONmyRS64hxQdQzh0TMlr+lAIn+aYW
	 3LpI/dS59JdGCkA1BiirilgvB8YiXWl/h1i0NdoQX3MxJP80MqcsyJI+m40tbJ3/Aa
	 +NJEki5b3tZY2ePxtOGVfN8RPgQTAeZMLvK0ngTv8Q2lHpeDBQygXWDUxj/KuySS1j
	 DtFHdJXerxgLm7l03r4Vo4izSDB+kBMPTy/XKLVrw73ATHxK0Tzl7xox2YUqtzysef
	 5O1vqn3Y2UaHh5wJeE0ydwSSy7YEpx7n7bYRABhPOpMc4cVGiL+F/Q6WFZajiyv+eP
	 uqwjOwXWTsweA==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ae2ce2fe1so4565695d50.1
        for <soc@kernel.org>; Tue, 03 Mar 2026 01:51:57 -0800 (PST)
X-Gm-Message-State: AOJu0YzoGc+NfsXojKiWlO3T7Gait+EaiuOCfQR105w/WeZ2fQ5I36a3
	qxz6v4Dzr6i05JxOD43BWjA9bPv4zKs+qiMZOz7Uytc3HwMzQRqHvSLDTL/Cwf3PtMy/IAIjUpY
	QpUkDl8H+B6CGCHc0iI4CZ+DXnCsUB6E=
X-Received: by 2002:a05:690e:418b:b0:649:b535:46ab with SMTP id
 956f58d0204a3-64cc2224edbmr12429538d50.49.1772531516289; Tue, 03 Mar 2026
 01:51:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260213-stole-economist-d5b0ac711d42@spud> <CAD++jLkDHh_WozDAot4c=1kYwy24sjH9-5_i8-Vmi6oXLp9wUw@mail.gmail.com>
 <20260303-crazy-shrink-ef2c085c99c4@spud>
In-Reply-To: <20260303-crazy-shrink-ef2c085c99c4@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Mar 2026 10:51:44 +0100
X-Gmail-Original-Message-ID: <CAD++jLnsT7B5FO1ThYS+NgdZh5E=ALnE-V3k-TiGw3JEYv8dwg@mail.gmail.com>
X-Gm-Features: AaiRm50_zRIl3DDZ8TPCxh3-gQQ3XT2N6HjNPMgWYnCBTJLoWzssuKdnbu3f9Bs
Message-ID: <CAD++jLnsT7B5FO1ThYS+NgdZh5E=ALnE-V3k-TiGw3JEYv8dwg@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V soc fixes for v7.0-rc1
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org, jonathan.cameron@huawei.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 10:41=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:

> There's no dependency of course, I'll split it out.
> Ordinarily I would always split them, but I'd swear I was told at one
> point that since fixes were on one branch in the soc tree that it was
> okay for me to do the same. In this case I did it on one branch to be
> less work to get onto a potential fixes PR that went out before -rc1.

You might be right about that, I'm learning myself.

Perhaps you know more about this process than me,
despite me being one of the SoC maintainers now :P

Let's see what the others say.

Yours,
Linus Walleij
