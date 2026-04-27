Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B3C3A5E72
	for <soc@lists.linux.dev>; Mon, 27 Apr 2026 08:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279907; cv=pass; b=TBYBOSyNEZnytG+zW6dRp+BoJmJT5H6gH6bTsItAdD9+P9+61jjaxyFKQYtmAZ9JHGl42Ub4NhRR69pQj8S+rBULUUCXgAm5i5JV46uZY+uM6SlQuwvFH+O7y8z5ALdtDzAtqBg0/ZFitQAFmeRLr+rsCQyRSZuw9YC50c5ZiMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279907; c=relaxed/simple;
	bh=zq5PP/J3hjWedEyLdV0M2obR/4e+SdXCXAM8LqHHWDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P0tCkbclWQ6HEkZwNvvSIG8eQceTEnxKjLVKoev6/cX/ty6VhAXLxI1BT74MwTnKYrUeCR3npXzqg3+fL26hmQFC/TlwM8rh2qV0dTC5DkG0kxjac6zdVQavzrfJnD2njR9ILMPzzCAkD7stTTQAbSP87qzY796qHrWWO6rP5kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yfATOYRe; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yfATOYRe"
Received: by smtp.kernel.org (Postfix)
	id 2D132C2BCB8; Mon, 27 Apr 2026 08:51:47 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7608C19425
	for <soc@kernel.org>; Mon, 27 Apr 2026 08:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7608C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7de431da8fbso4142959a34.1
        for <soc@kernel.org>; Mon, 27 Apr 2026 01:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777279904; cv=none;
        d=google.com; s=arc-20240605;
        b=MQjUoe39EWgpATGwD34W/dc16LXhN8BB4dOTGc+/CA8neu+HPs2SQcFrVwoSpqX2U3
         i+Wzt7bMvxCjrn+Io6n7fHtMi64KfbR9Wz1HLol4vDVjpN3X8hkhOqsyB7AWDuw0Q37a
         aHVXk6TlIlf1z0MAl2g4TnEFu6Jetp+xYv7a4YQWY9/vJ7hd8xmZ1c7ecOpO0427fBfb
         8wx/fGGW87OkxLdcvtKMsmkgQB2kDUAbSnfooZQ+jU5dxYsAZ8rRhE4J5oGt7MYdoNo8
         hTpuOOeMisqFllRx9P6IGu8xGPtESAhDc8cdX0q+6TMMEFCzQxD5AycSXl2J6J68mHNK
         lZkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XT3gbcq+fk250A9gsnTsBOtjpgbR19UnsNKNoI2tldU=;
        fh=/7cAvsTdM+gCWiKjQk+MZ4QBk3r744mtWEvfqGTWGsY=;
        b=H9B2rH0Jumq9puMckaDhm6y/NG0GaFSNgCR5VGSlO0UHatyrIkmRNbbOM97GjCsdaZ
         6W2ekXtOtWEwfbp8BMLLAOCopCuTL93md5ZsT3Dq87pvzWJen1XZh4ejovFLWeh8yswZ
         Y+Jv9eDeTw0F1wjUNPmhwSVBQAGbsynhpF0Nfk5k6nshiA6QAy7Zi7xQWfohyM5zmVz1
         JiQNknFYxGr/MQ40lm6SNULJBj6FSFBMkXpCgdbuiDf68OIpsT08h6CEImQ9Vdgk5Di+
         v9VA8oL4DaJmFfEsLbzFikSVRDcygU6QN5TCtDp03dxqCROvIfASXnpOxfQB0Pdrp+LH
         YWzg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777279904; x=1777884704; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT3gbcq+fk250A9gsnTsBOtjpgbR19UnsNKNoI2tldU=;
        b=yfATOYReWLEBQR4HlRZsqCIvUXB8zyjpmO/F7+H9G97/P5hOzSrZvuaimoaODcjpBr
         5n0NFi8ps8acyPTk4Bb08Wy6DXWQaC5cce9VJ+kx8cBWO+A+GfxHhA1IQLkhcLOZOJd2
         MkAiHohEUCL/hF4+eRI8CW2dHfKKst99liBbiAqc6JbxSWVNpvmXTXUTcx4CqGn4RFp6
         ezxe/cA2gVx7rbQ9vXI5m7dhGgEND5wFxF/33ol0J1qFzKPcld1cLnEvYkVWLQrdWD3d
         TAgeOn3LLzAX1aEzXCkxrXnqjKYlCc15vIxhfitDYvd2aJ6TkB5X6bsNIwhHd/yHlWuw
         q7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777279904; x=1777884704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XT3gbcq+fk250A9gsnTsBOtjpgbR19UnsNKNoI2tldU=;
        b=lTVIWPz7Hpd1tt2NtHhMTYo8LkzWnk1YCDrzlZFX11yWSj3U1fmM7hwSa/iKB7WXpq
         sOgpzCtdZcruAmpTyjargIiTIKrgmsHXWqaGtUIHiMoHhsM3uDVrPH9G24oIflBObLqI
         UqnzNCogPvRSzY0H/1ZyqQnRqtHn3eUcGI/w43qHG3AftlHoF0CML3t777gbeS1Zjfk7
         wPiRenDPaO8Oy1apnsMzzZj9Sy3+QhqB2PBYifMjc95Nc5WEvJrMZ2roterD8lzaEQhC
         3YspShGCxGcUQJD+yw3SUh9DGK2uc5s0kH1KHqOCllVXt3R+3QWLhjOdBSYtO6qQrsj+
         dxSw==
X-Forwarded-Encrypted: i=1; AFNElJ9sJJa/UKqVo3aeoyKE0JvwPGMXvlE4M0XnhRE/8HEeTp8FGXQuFK8BZ/xB5Nry4p+dsT8=@kernel.org
X-Gm-Message-State: AOJu0YzBCZar4ritzM5DQ/ATKbv1dwosmZ9yCwk7eBsTCdQgZtpVy9g9
	b5ViOe8cdbn3Mk9aZOtzt2G+ZEbJder+xj1O/iEn2ujgUIDW3+KIr986YI1EGu1rBOXrBzafuA9
	EM5XH9BT6B1OSnIq0mzyuu77xmzLRXRZKYb2UEOW+Mg==
X-Gm-Gg: AeBDietDtelcNi4AzJzpwv1cA5NfsVXyJKDwMdOvz/OuyrVvUhrA0mpVr/0uEPgEOvV
	moD7BqqRa46X0WuIEOHaS/AIbNQhj+ul2IVuHDso/Zrp++2F8/+JCyYkwnTEUlHYORe8Y6zBSk8
	88Ql4VCkTOwoHcsHQDr6rhtdeNVG7IeMF6B6ILqEMTp8WTdLw/zGz+lv6JU6KttRQWrEAEYdCZ0
	rQe8nOpz+33cBWpDd+SeqLUJ34KGfNEVZFIDzsFjkQisWfZzYX65kYFbI8zbv0jSI0UTBLXpO2Q
	UrGf+cb4ItDWIXzENOylKA7AVGqjMJnbFtYpFn5IXJTxYrn2Jvp4Ja6dhVM=
X-Received: by 2002:a4a:e903:0:b0:694:8ed8:e57d with SMTP id
 006d021491bc7-6948ed8ec24mr16715234eaf.58.1777279904554; Mon, 27 Apr 2026
 01:51:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260316071210.GA2470832@rayden>
In-Reply-To: <20260316071210.GA2470832@rayden>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 27 Apr 2026 10:51:33 +0200
X-Gm-Features: AVHnY4LMRWaAwM9YY5FDDDuE2oBKAAMdMaxEoXqUa_2V6ezVDw7lz7SimrvLSMM
Message-ID: <CAHUa44Fpy6Dywfe-UA0Wx0v5D=jb6=SNiE+Wi0g08EtCNLepMw@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE fix for 7.0
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

It appears that this pull request has been missed. Can you pull it as
it is, or do you need a new pull request?

Thanks,
Jens

On Mon, Mar 16, 2026 at 8:12=E2=80=AFAM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>
> Hello arm-soc maintainers,
>
> Please pull this patch fixing a use-after-free race in the OP-TEE driver
> where a client exiting prematurely could free a request still being
> processed by the supplicant.
>
> Thanks,
> Jens
>
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>
> are available in the Git repository at:
>
>   gitolite.kernel.org:pub/scm/linux/kernel/git/jenswi/linux-tee tags/opte=
e-fix-for-v7.0
>
> for you to fetch changes up to 387a926ee166814611acecb960207fe2f3c4fd3e:
>
>   tee: optee: prevent use-after-free when the client exits before the sup=
plicant (2026-03-02 14:36:50 +0100)
>
> ----------------------------------------------------------------
> OP-TEE fix for v7.0
>
> Fix a use-after-free race between client and supplicant by serializing
> request access with the supplicant mutex.
>
> ----------------------------------------------------------------
> Amirreza Zarrabi (1):
>       tee: optee: prevent use-after-free when the client exits before the=
 supplicant
>
>  drivers/tee/optee/supp.c | 107 ++++++++++++++++++++++++++++++++---------=
------
>  1 file changed, 74 insertions(+), 33 deletions(-)
