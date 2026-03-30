Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBA83B3892
	for <soc@lists.linux.dev>; Mon, 30 Mar 2026 09:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862673; cv=none; b=Cn/QM6bmqKuGfFVa3lE/8txDlmB2VzM1NfDWZAfnocn4/keUKcnhgjDB1QuCdmvr/ULAYq5k7B+0I6sKimxKLSkugC15NGci3k2shYmIH2ZPe9QTe6WU3aELPL7SH8w3GsEFO4LpL58b8PEbDXsiFEL/16INxYodtzmfiDVWgOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862673; c=relaxed/simple;
	bh=CbJf9Iw+tHrCrJt1ufQhWH5yjcoDbD42PT8F9ETtZDY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=inlOIjNADCidmSgM3Iv9LIoRqymNSPciz8fReQgl9G4smgbtpkMuQkmT6gdB2+pzlThIUAZPRuW+kQCoXg8O4LHj9qY4AWDqBkVPBI91GcE/mb/6n8PQS6Ao+Nxs8X8rJ+fCBNuIYmd5KeMLiuYGQjWhkespArNVC+4ao8VliFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 4A9BDC2BCB5; Mon, 30 Mar 2026 09:24:33 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1AD6C2BCB1
	for <soc@kernel.org>; Mon, 30 Mar 2026 09:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E1AD6C2BCB1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a1438649b2so573304e87.2
        for <soc@kernel.org>; Mon, 30 Mar 2026 02:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862670; x=1775467470;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CbJf9Iw+tHrCrJt1ufQhWH5yjcoDbD42PT8F9ETtZDY=;
        b=b8NZEnzhEj3ZZgxsKY2zAEz+jY85ozPus+Z87uyfPjDTvtLjggusJFPhkXi0Uf2PDe
         9FUZ6g/tCgzfABbb7EcVL1F09SeaDIvl4HjY7rPlSlzMuCqjTsZALMNdCsV0x4SGIiYl
         tou+qgYJDRMygiEPaR/dZM+tKcPsMgPhHUC1LopjQozLOERcy3cA6QjhWcws+CqLvGBn
         m5jFad0PRF1K+69kXVar1KTVGEUeIznr/dZBsU3K+y0he8gMm+rcI3Uvxybp7piaMwBN
         ls7WVF/l7B6FMVl1bm44JAzndA09MykqKBUOqMxyyH9n0rDkxomzuj9a8QLA78TxoTjX
         Fsbg==
X-Gm-Message-State: AOJu0Yy+V+CCziUDCqYyE/DcXhZa+82lr1ge1KCJnBOV6HQrG/PffIJ0
	37Z0M1A32BdRWhUnBDJd5ZM856NH6aFa+HmvVfWD3fybjIfDs9m4U+T2
X-Gm-Gg: ATEYQzzxSbV9JrKynedOlIF3q7Op2y2i+r6LHOZy5FlqaW5RPsfJlEKP3HJeGUvzZN7
	GIq89KNXAMjOIvyUb06/rnCgzTxQPy51qcwBSM9B2rdegnDbr6cvns7AR6M8WKYT7uQAV+iNlXn
	nb0xrzNNYl2n5YvgJMg90AVOs6SJnWCsgBGa+/4IzBp2YeRctQl625dUHgOqS68gKGvjHkq8ikq
	tBgQF5iAQE7tTH3Fve5R/l14GPubXAHkSe42lTZm9R9gchG/CXNvXzxScHYsSrv6dvATcqHZbTP
	Lwskh4ZVowa70IsEO4JVNayCfOO9Yi1MxDXZyRYSHqawrGEQakuurRpOJjnL3lMrM3sh+s8s7Zn
	Fu4gnMn89ZKuDe+kK+FtkNJrfehmeu6bM5Xgpl251pXQcn/pheAF9yIehRNynPw4oZy76wb7wkn
	20S4A5VEzAAm9BG20aXSSuaGx4W7x9EFpz0mTARqhiXlBLCEU=
X-Received: by 2002:a05:6512:3096:b0:5a2:7ce7:e3c1 with SMTP id 2adb3069b0e04-5a2ab92ae38mr2553569e87.8.1774862669672;
        Mon, 30 Mar 2026 02:24:29 -0700 (PDT)
Received: from localhost ([176.106.245.85])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13b13bbsm1534889e87.0.2026.03.30.02.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:24:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 12:24:24 +0300
Message-Id: <DHG0B03HM9S2.2QXKTJEGPI65B@altlinux.org>
Cc: <soc@kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Hal Feng" <hal.feng@starfivetech.com>,
 "Conor Dooley" <conor@kernel.org>, "Heinrich Schuchardt"
 <heinrich.schuchardt@canonical.com>
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
From: "Ilya Sorochan" <k0tran@altlinux.org>
To: "E Shattow" <e@freeshell.de>
X-Mailer: aerc
References: <20260326-astrology-rephrase-836ec663228b@spud>
 <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
 <20260326-viscous-rigor-4beb18f77eec@spud>
 <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>
 <DHCYMK8FEH10.1Y1YWLL3J1HSK@altlinux.org>
 <ff792101-61e3-4470-9c5c-eea375edc9fa@freeshell.de>
 <DHDFR4K758TP.291K17J2J5VL7@altlinux.org>
 <a77f7c9c-4357-47df-95e1-f6e0f5a7c02f@freeshell.de>
In-Reply-To: <a77f7c9c-4357-47df-95e1-f6e0f5a7c02f@freeshell.de>

On Sat Mar 28, 2026 at 1:07 PM MSK, E Shattow wrote:
>>> I'm glad you sent a patch, but I still object for the other reasons
>>> mentioned.
>>=20
>> I'm glad to talk to competent people in this space, however I still hope=
 that
>> the kernel will refrain from breaking this feature until it is really ne=
cessary.
>
> I hope you'll continue on to review the BootROM r.e. effort and cite its
> code snippets in patches so adding bootph-pre-ram hints covering the
> eMMC SPL boot method from StarFive Loader, retrospectively describing
> the SD Card SPL boot method from StarFive Loader, and/or secure boot
> crypto accelerator functionality in the starfive crypto driver (what
> does command=3D8 and command=3D9 do exactly?) The exact nature of the bug=
 in
> StarFive Loader UART XMODEM incompatibility could use a proper
> description, and SPI Flash configuration parameter analysis, too.

Unfortunately this is beyond my competence. This exact issue was fixed with=
out
any r.e. only using git bisect. And while it might be interesting diving in=
to
learning how things are I'm not sure I will.
