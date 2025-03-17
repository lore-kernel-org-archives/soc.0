Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E38199947
	for <soc@lists.linux.dev>; Mon, 17 Mar 2025 18:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742236650; cv=none; b=SzkabL0GGCjyU1ypLWDDSmSogiDKxt+F7CG3khWf4zhIe+QLh+h63ymBSe8qh5tjX/70tT87LyIOFLmE7prtspr6AAPiclVNLLaxgA8w0TfWdjZEFUJRp7Mdk1kcKRM1mn4JQHP9Nglx8DDmpkhudTQOXOE2MeEvhjHxMguhhnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742236650; c=relaxed/simple;
	bh=q59iJSJH2gYjj3Ke2DcYEO5vI7HOkzDhzrWL2ugzs5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYvXLIViheUdFEbEuSSw+6DWEKM7EqOb9Mkbrleg8wQTeqlPdSM31TCsr5QAmNl8ZfVx4Rlh0W2LceZyGCStZ9GEM4SRlFES0EWjgEqjnJ6c2r4IqHoBrqA/YilZ9rNN7pVvqXJUDVQeeP7SKHp86ElGvUgri2yZcNCoABXDIaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fNS8cvNw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fNS8cvNw"
Received: by smtp.kernel.org (Postfix)
	id 2CF28C4CEF0; Mon, 17 Mar 2025 18:37:30 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08AD0C4CEE3
	for <soc@kernel.org>; Mon, 17 Mar 2025 18:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 08AD0C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so3018625a91.1
        for <soc@kernel.org>; Mon, 17 Mar 2025 11:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742236647; x=1742841447; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnTcDDxnlcu92lmsvpNmrd7wbvCxZ/y02TWD+ryTtug=;
        b=fNS8cvNw+Hj/oQenqwnZds2CGKFHnb5nrhZRrNMwfwGhQpUBX3+WwYTdsb0rP3A2UJ
         eOzbxz7aC02kHXKYxe0ZDpciZNUBPkkf7N8tmXRWWuipGoiGG03OrmWkjm+udQFNvdKR
         hGisvcUtRYbQNzXKQ1Rlf/0D6SFVqzJ5BfvnZtYi2j7kZ3WRpbtSS9YOO/eq6rFZ++py
         3GRcwiIFb1BPG2NPSJHa0T87/L4L9AkGw/N+eNjyfoQJlFqKcfdo9azDp21+WLTwMWN+
         KHsmqjTp7svRnPVlpQ9keu8YlUOduEiNQS4pfg/CIZEZexCHYk7GkMqPBstV4HbqAkus
         a7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236647; x=1742841447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnTcDDxnlcu92lmsvpNmrd7wbvCxZ/y02TWD+ryTtug=;
        b=lvXPeN2XP9pTSVrAuhOtSSr4fwSrGtd5/YqZcxIIreSIdlnJN0frqbwzmgrYwPP5cD
         ka6XycN5bXin3TN35LVfJynh9A/hMwc00OxBBpNDuRLga7rYeveCwBItEvx6CVq+0hKr
         qaeWYyK9TseMpzoVXqr81UiOQh/bRySu+vzrkR/V5Oyc/7CVmVtzYeN+7iGxBGdLVBeL
         63J4I4BbzsfjAZvBaJC+PsE/OcR63Hk54sR1lf1xesB478guxJESWaPm2o1Leo82sNm1
         zHGurTcklqECuGsh8PqmUjMY8e+W/ZIdlIqQPYTRfdNItpfeHDzXjcmsD7vNYu/xEoBP
         etyw==
X-Gm-Message-State: AOJu0YwcuYdzsYDTeakYMd0ww1Vn6LLdPZ8NcM/8+rW71gTDAKqDPcax
	z4IrXgGlJbZQm75lTNWIQ23KWc4G2dWaSVTxucpOgegVAL+pD1GVSkejFmjb3IkHglU9aVEyhq+
	/Hr+BhtFKTG22Vj4K4h+vKmI7P4sDb1Y4a31SPGSVn72fIRDFyek=
X-Gm-Gg: ASbGncsdRnr+kq37+4/iXo3oFbHlZdZOnUx/4MmCNRdDx4dySrG1fNTma3idqCxMCWv
	KcTPUtojBPqEOwsHH37DHRvEseln9XVJm4A45eEeJw61sHjHL/Ok7eHgXW1oOi/05WJodesLf+N
	JLUNmBnmeEmWhrl3GHaH029QFDWSBXH9CYJVc6XA==
X-Google-Smtp-Source: AGHT+IEhoXE3G6cQ5PsnTmHbL5R88MWeJjXOzzkHY7nsry3gktOpZ2t5U93aL61v6oxrZzlHHYJm0XVXQXeQDtBLhAg=
X-Received: by 2002:a17:90b:1807:b0:2fe:d766:ad95 with SMTP id
 98e67ed59e1d1-30151cd2f55mr17924347a91.9.1742236647100; Mon, 17 Mar 2025
 11:37:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <7hcygyb3yi.fsf@baylibre.com>
In-Reply-To: <7hcygyb3yi.fsf@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
Date: Mon, 17 Mar 2025 11:37:15 -0700
X-Gm-Features: AQ5f1JpIDMTdEuLdnoZ9Sgoh0AJoi8JyKOnu1RuLyl2dlsvLYLw5n8ugF-DlDxU
Message-ID: <CAOi56cVkwwsRQo-KQbME-Nmc2HemjmFEDn4_oaGcg9Te_MU_hg@mail.gmail.com>
Subject: Re: [GIT PULL] arm/omap: drivers: updates for v6.14
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Tue, Jan 7, 2025 at 3:26=E2=80=AFPM Kevin Hilman <khilman@baylibre.com> =
wrote:
>
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b=
37:
>
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git ta=
gs/omap-for-v6.14/drivers-signed
>
> for you to fetch changes up to 6ef4ea3c944b9fc5d78317d1172cdcd10f9724f1:
>
>   Input: tsc2007 - accept standard properties (2024-12-10 16:17:30 -0800)
>
> ----------------------------------------------------------------
> arm/omap: drivers: updates for v6.14
>
> ----------------------------------------------------------------
> Andreas Kemnade (1):
>       Input: tsc2007 - accept standard properties
>
>  drivers/input/touchscreen/tsc2007.h      | 2 ++
>  drivers/input/touchscreen/tsc2007_core.c | 5 ++---
>  2 files changed, 4 insertions(+), 3 deletions(-)

It seems this PR was missed for v6.14.  Could you still take this one
for the v6.15 window?

Thanks,

Kevin
