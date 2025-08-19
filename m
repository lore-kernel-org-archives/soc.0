Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14047305052
	for <soc@lists.linux.dev>; Tue, 19 Aug 2025 12:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606563; cv=none; b=LaD720PEGMOpf4DG2Q0bgV1ViX2xS6d2A5jelpFIq2BGt9eScETsBaEoI8oDciJxBclJukly37QLTGano6jcIPPTQm9h4GvcVIKh3DDsCdBWhZAXnjcEmAU9fMccEu+sxfDe+B8yE1L3d50u+Bmvw2FiyaXQM6q8Sqw8bU1Uq+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606563; c=relaxed/simple;
	bh=VzpI30UkeawZmaVqAnif/Xf8jsvVOdlincz/DMcQfeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bDZVoqorI+6wswZypeWkHHYULQ241WigLrhZHIKCsWWmXmci8s+gBnE4hrC/oGfkunIE7V+S9maYVk49a1J4yMKAAPx4gu9QhGSIY+bWbTeXl1N4eQgphSsu3Jxs2Nc6/8IPU81dh85So57ZsvrWoQdMIjJupSttGw9M+5gRtBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ag+vHwuV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ag+vHwuV"
Received: by smtp.kernel.org (Postfix)
	id B2586C116B1; Tue, 19 Aug 2025 12:29:22 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D32B4C4CEF1
	for <soc@kernel.org>; Tue, 19 Aug 2025 12:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D32B4C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55ce526ac04so4924252e87.2
        for <soc@kernel.org>; Tue, 19 Aug 2025 05:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755606560; x=1756211360; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UipPaNtmeiclDOI6M9CPZuTeZBFQiA+rXuvCoDGD8Ek=;
        b=Ag+vHwuVIqhIDfXc83OIpLAEKHEa9+bnMYQNssfu7UUAIE35cWylTzgYn3nlynjjeB
         ButzyBqeOhiAz8f81/MtU2qOfXtnxjMo9yZkFHw42ncEBVXxad9GToo1qD6NiE5lq3uT
         jywcl4YuCgwMNa+GziJ27kZs9Yxsx00242hziKYwpp0zsglbmngWGFrG0de/pdhQpTlv
         QxQ19skwe0rBm0tqnlqASXiS67g/SYA350DG18X6C8PA7MyJ6IFeUUt7CbrzeI9MbOvq
         3AkO1o8otjXeseXkb/P8z7vOp7Fn19pVWacOgzSC7ws+b55yxMyp535O1jJboSpgmbFg
         ygKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755606560; x=1756211360;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UipPaNtmeiclDOI6M9CPZuTeZBFQiA+rXuvCoDGD8Ek=;
        b=G5+wT3ILXyEJIN/PHktviwQq0ZyP4eHW/1aWU8yMhcovK1h/WQ6Pyj0qm7n9SbX7QV
         e90mi2TCjn9DQkgQLU0qq0JtiKM3nY36mYyoJvbPnNLmAnMUlFdzuVvaLALuFJiegq+C
         gsCwYcMbn5Ve5bOYRVctQbcC4lJqcupi62b4oM7J5PN3kQyEXWXXz9r9F3TtAu7oxJkT
         Rm4LrI/ghligA338Xy21lnajdz5+HqqeRdQ2sgWQ+cjbrqZIRvfERET+T9ZL317znXtb
         BDyzPd/Xzuad/qMhs/O84A+5NopTgnWbkAQHAIJeRPM3T57nt/aIpDs4RBg5fsXksofq
         T2XA==
X-Forwarded-Encrypted: i=1; AJvYcCXujc66XSMCK1fjM217PZ3ERwP8A8fTAWwIOUypTtiEXuwJPrC0msb1qyJeSfIvFLbSNVk=@kernel.org
X-Gm-Message-State: AOJu0Yz3ig0ZzGxjQfvqNDbJ9vB6K0zf7jW3BHLTD9SCcVGxXy2w1mLW
	yIAVSJXyUOSbqe3yAhAknbM0ZZuGEoiUKG0Nu4mxbsPs7zBKlPC9SR357V9GHOZPw+w=
X-Gm-Gg: ASbGnct4ENnuKSv0CZr/i8xE1qkCCKNPJsxkquLSksxi7T90Wg+irzFreHSfR9w9RUi
	YRAporFfzkQpL/nxTQLwiFIeryl0cCtu7OXGTZEYnP2DSP3s4sOslrdUMuCPgY5ykPBfW9TG0kP
	F9IdhxbsBz6au/Q/hoAQCCzpUwmAQ7sRSWkBsz703vZD2wJhxrXVsI++UoSNWq7Ke7XGJKbINb4
	3YCwXoPPprTS8ocqLf7GfS2ZwPlP+L1T2gnRDhVYqWDeug+pu82nnyLO4ZetWECwR/fO8W7PNy4
	MHPGwoHMRLYzE09f/shrR8cdyXbaHb15Czh3ApGPQ1ix6fxZ779uqi5HU+PDo6LlJmCjD0mJ6w5
	t7Db5F76bKHEdVL6ZEFsjEg==
X-Google-Smtp-Source: AGHT+IFha8J313pxWbqhKQOw7U03tO4cI6VgHA9135xIQnSuHavKRTIlRfvQUn8KhNwo4cxLJh4h8A==
X-Received: by 2002:a05:6512:6318:b0:55c:c98b:39d3 with SMTP id 2adb3069b0e04-55e0086a835mr622415e87.52.1755606559962;
        Tue, 19 Aug 2025 05:29:19 -0700 (PDT)
Received: from rayden ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35145csm2136867e87.26.2025.08.19.05.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:29:19 -0700 (PDT)
Date: Tue, 19 Aug 2025 14:29:17 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE typo fix for v6.17
Message-ID: <20250819122917.GB3486750@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small patch fixing a recently introduced typo in the
OP-TEE driver.

Thanks,
Jens

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/optee-typo-fix-for-v6.17

for you to fetch changes up to 75dbd4304afe574fcfc4118a5b78776a9f48fdc4:

  tee: optee: ffa: fix a typo of "optee_ffa_api_is_compatible" (2025-08-18 15:05:49 +0200)

----------------------------------------------------------------
OP-TEE driver fix for v6.17

Fixing a typo in a function name.

----------------------------------------------------------------
Sungbae Yoo (1):
      tee: optee: ffa: fix a typo of "optee_ffa_api_is_compatible"

 drivers/tee/optee/ffa_abi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
