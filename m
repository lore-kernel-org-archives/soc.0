Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090B721E087
	for <soc@lists.linux.dev>; Fri, 20 Dec 2024 19:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722874; cv=none; b=pBr1FLuJIiIEv7NxvrT4co/K8S7w2BYMMQLMj3JKNF5ySmaEtdNlRKHm5Us5DxZQtXCA5+9D40mcn2627tMm0laDBc+qLF0COr89tYlQOJrmc5FQ5sbjIV/kbjWlUZJIeDImTjzPTC9s24DSuEyQrlqkYpU7j8y5rOdyXa9ofHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722874; c=relaxed/simple;
	bh=6r5rzMO0kN4iH3AsEvrAPJwamMt3khwCzu4EWS8cDWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpqXMkh1ZYKKK39G0yW3MBalxl+I6u3U1k9QBsJae8Q+5s3VZWMCb63+jteNXzxTJWR2VUu+Um1PJI/OKnxgvZvHAMm9ESI+ewkCFOm0VnE0EOM2FyaInJ9FI/Iy3pH4ZAwZngoMm8SsBRI14wPDgJvlBKmVcqZl/dHZcR7DUCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lixom-net.20230601.gappssmtp.com header.i=@lixom-net.20230601.gappssmtp.com header.b=AEEebuoY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20230601.gappssmtp.com header.i=@lixom-net.20230601.gappssmtp.com header.b="AEEebuoY"
Received: by smtp.kernel.org (Postfix)
	id B42CEC4CECD; Fri, 20 Dec 2024 19:27:53 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60FB3C4CED4
	for <soc@kernel.org>; Fri, 20 Dec 2024 19:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60FB3C4CED4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=lixom.net
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21634338cfdso30610025ad.2
        for <soc@kernel.org>; Fri, 20 Dec 2024 11:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20230601.gappssmtp.com; s=20230601; t=1734722871; x=1735327671; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=olddjwhjXo1DqV4GopOeuanmM4eDV0mXoyDwwruYnUU=;
        b=AEEebuoY0b1XyTBZ2+DNDLVroC4djuaSyqp+EDI/jW81pwOBs3pkXWKXk/CI4kGw10
         o+p27y1Re+mfrC6Ub5i9k/N2PlXE79fxpzRut6K9uLYhLa9n+bRoC9zmpVD6cKMLmwYL
         YCSwjpPceMohtcEsOgqBxl2R0VR3CZh5SDdXOLFqsy+xEw5j/65Ysp/Uar+00mAdyexX
         DyJqgobxmEH1owLOwg4qtZN5m5YEJ5lmFWKSc2rDQD8C3v918QE3gHKAqsuFUcdvK5AE
         +F5ei74/SRuPVtL1aT2Unhbtaxq0IXqjFQEJYzSEvTrkji/iPJL7Nomudgraq8uLeyOG
         NXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722871; x=1735327671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olddjwhjXo1DqV4GopOeuanmM4eDV0mXoyDwwruYnUU=;
        b=IRXeb9dtlc/01euyFksY/IGllY0rIJwqcMGsfRTZ/KOEDzf8XvwT0DTsNjMcHK0xvF
         fSA58CJpPwAeVXHEBX8aoFittsKwNL8NYic7+AlgxonVf3KZ6B8ZbBTjKVDylDPTcMyf
         Zn5l3q8KOi0iMWGNAiYBgtQajgf2pDf4htvBoSiFdXR8+Fsl0PZI6DhdK1CteDrCGKaU
         qSgz4nE/dYbs7g5RbH4fBlXyOwB/HgiDbrLYtzGrM/5deMonRM/wOUTfZaOenCsjncog
         o8CKoiUtZbrSD2kCdVb8blxdsNqPZbuHW92RMxlWAy8d2AwDegmlmE3grjwSa11FG0vW
         QYoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEhLx3NrEof2iSrhhuO2zFBVsUekv07TYsJDF0wTeNNLl5yX4KMU7urhfwUEoQlpxVDi4=@kernel.org
X-Gm-Message-State: AOJu0YxqFe2RjwRzfoPg4SX8xVYyu3/c1eO59bdmDLeCtrofVIp9Pzbs
	E5ZzeMRpK9RupqfniWTKRxgkTgn0tC0b5rBiNgYKfRyVCUVoJCJbS6D7m1idQFM=
X-Gm-Gg: ASbGncvmpNXfFWsPF5HlpmZd8NN+GppCJYzXgov2dQfHmxKEbLaYBrQEfwRiWDLalQF
	YL2JCxiIhlGJb75DXuZu+K8zQfNe5foEAKnlSlY436qKKxuQhusa+m+Acq7SJiG1Ql8MfqkHhaQ
	P8B3Ct8pMj8s710XOAtbDKSYr9IS7rq5Ejq7KqqD9/1PlYeK9vagcrW7cp+dMzpcuz5CIJVbEfm
	LRc5GfmgV4OfdmfOl0VNxhfAEhpaCoAtl/eWMRKmxbPpd+3X4YRvT2wsFWJzsT3Eys7pCkvO1K6
	qxbTXgJT1yCRyfXlMHvn0g==
X-Google-Smtp-Source: AGHT+IE5WE5VjVzI8McvBS1EPUk/D6S0aLKI1p8PJ/8RcVaqoOiUvLB51cQP6j5D7CMD/aylGcndww==
X-Received: by 2002:a17:903:120e:b0:215:6816:6345 with SMTP id d9443c01a7336-219e6ea278cmr54424305ad.16.1734722871527;
        Fri, 20 Dec 2024 11:27:51 -0800 (PST)
Received: from localhost (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cde37sm32680745ad.131.2024.12.20.11.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:27:50 -0800 (PST)
Date: Fri, 20 Dec 2024 11:27:33 -0800
From: Olof Johansson <olof@lixom.net>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, soc@kernel.org
Subject: Re: [PATCH v2 0/4] ARM: config: stm32: Remove useless flags
Message-ID: <Z2XFJeMgUdaeAqHS@chonkvm.lixom.net>
References: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
 <c720715b-cde3-4ab4-991d-37e9ae91b16f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c720715b-cde3-4ab4-991d-37e9ae91b16f@app.fastmail.com>

On Fri, Dec 20, 2024 at 05:47:01PM +0100, Arnd Bergmann wrote:
> On Fri, Dec 20, 2024, at 13:55, patrice.chotard@foss.st.com wrote:
> > From: Patrice Chotard <patrice.chotard@foss.st.com>
> >
> > Running "make savedefconfig" highlights that some flags are no more used,
> > remove them.
> > Remove some flags to reduce the kernel image size as STM32 MCU's board
> > embeds low amount of RAM.
> >
> > Changes in V2:
> >   _ squash patches 2-7
> >   _ split patch 1 in three parts and add epxlanations about flags removal.
> 
> Looks good to me, thanks for the update. I assume the plan is to
> have this in another pull request rather than me picking up the
> patches directly, right?

On that note, I would *love* to no longer get patches into my inbox,
and I'll start to kindly request the senders of said patches to take
me off the recipients in the future. I'm not actively part of the soc
maintainer group any more, but I'm guessing that the others would benefit
from the same.

STM32 already has a maintainer, so there's no need to send these directly
to the soc-level maintainers, as far as I can tell. And certainly not
in the to: line (vs cc), at that.

If there's reason to send them directly, such as the platform maintainer
being unavailable or the patch being urgent as a fix, a justification
to make sure they're not missed would be useful.


-Olof
