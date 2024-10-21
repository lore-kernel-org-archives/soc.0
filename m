Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9331A1E5722
	for <soc@lists.linux.dev>; Mon, 21 Oct 2024 11:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729510558; cv=none; b=OfI9Ecra3HxhqLzeQ9VHRmuKIWfH1bXhNmer5IzVSPHrPEDFxjIUmieBifqJznFKifb35WjLsF4lgyRGdgfiCuaMtXM7DluVqWF9e2Y+nS2M8x9P4H1rOgV/sAvkJCtNZ9yIvmWpa5HU7M9b4zIbnMbAgO1PMKG1aYDGLQmll8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729510558; c=relaxed/simple;
	bh=wjEkgv5CAVmSpH67LEGbvjgimQJCJNpm5j2igM88oRE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=FJdszfnKZ/MxnNOQ5lAnG07CribaoIWy4klQs8j1R7jFnGPS+U3pzcjez8YS4F0Sa4uL4WoQk9ZFcMkcozaT9LLEIvGavz/i2eHsQfifgPMMEVooKjuuSAM01CCrGmt5kEEyKGEer+0kpPEkPeNfh678luvkjJV5QMSeGzqBogo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=etxuSRf/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="etxuSRf/"
Received: by smtp.kernel.org (Postfix)
	id 31994C4CEF0; Mon, 21 Oct 2024 11:35:58 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3BF9C4CEC3
	for <soc@kernel.org>; Mon, 21 Oct 2024 11:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A3BF9C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539fe02c386so5320791e87.0
        for <soc@kernel.org>; Mon, 21 Oct 2024 04:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729510554; x=1730115354; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iZgQWwMbz3AUs2e2HBzZnynxlTDrH79hehgeaCylcnQ=;
        b=etxuSRf/70UlTAaACr4cb0o9w95ER/y6CT7KS5sQ5D3QwG/mk0y0Zj4zO/+pQbhbqw
         cX6x1fd3kGGzQM0iLNYYNA0ta3LrZPoyiXyolD1VGV5Cj8A1bD7Kuj9eXpualy6ndiH5
         b3XHSyC+y/Ow6FjZVSzgpxVRJwt3Hm4YUFAYWHyGeh15lXufiww7HhbUmh2KRV/7PhRH
         RdkvOa2viVXSI0bj0hVq2Vwdd8S7xjU0EvH5QqMaXAk7IGrYL5mIkP+jhet4BH06CR5Z
         6b6ypl1bsjJmDWc5CE6sJLUuWhH8gu/xQFDKJ+fMnDT2YE1RqRtYCG7wLK2d+WQKwfI0
         kbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729510554; x=1730115354;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iZgQWwMbz3AUs2e2HBzZnynxlTDrH79hehgeaCylcnQ=;
        b=SFIlBWBoOxr8v8DpbZh2cJJKiNct/nGFsIgyJZX9cOgZu8Yuwl8chOT7YYie0BaezS
         JDfd35bGCFbAjpUObqpIsWHFdhVKuexDfvqEZQ8RQjFET/MrBip1fSVvXUWEqMDq8GAR
         5jy4lcvK3R7twmRcAnTS5WJcPkt7FejhNHxdeLtN/fjvWNWq/sUiSqPkd3QmS+H6LrmX
         WSWbdpNv2ul/pYWDogX7tM36HPZaiY+aDRPwqZk9R+oohJ0iricdfJTC//ZtkLPXH6yN
         Wg48qcgrIWP8N3fOr47N+fKEbi4BWZ6PfxBuhjn08qHszp5LsquyjHGw3ku+FnR0PIve
         TSlg==
X-Gm-Message-State: AOJu0YxlOzxFNfjcp+qzx9MzUe2vLz4AzvJ5880Q6aWn/23ec/uG4EqY
	H6OjrxQ5ikq71EjNLTTvLdmHX/UWkVcuvQV+qTRswdGiWAeskd5ZN0eMKjpl3diKXfbst8KpWJb
	ttaBIyvHajbr7PDQmL3p0STNfyUC13a8kM5wvA1L/jDEhoVYNUbs=
X-Google-Smtp-Source: AGHT+IGDImnSVd1NLeuo7wYNgA6MxgRIRW9nTKeOGsGXoBPPdVcGHYm3tvFiqJHdTx4L867VbSqk0VGDIldyo88XqSE=
X-Received: by 2002:a05:6512:3d10:b0:539:f775:c0bc with SMTP id
 2adb3069b0e04-53a15b9b1c3mr3831790e87.29.1729510554065; Mon, 21 Oct 2024
 04:35:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Oct 2024 13:35:42 +0200
Message-ID: <CACRpkda5rix2JLYpexXTeGqKBcHeWxZx7A49jYCCmDPU7CFLSA@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS updates for v6.13
To: SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

these are some Ux500 DTS updates for the v6.13 kernel.
Details in the signed tag. Please pull them in!

Yours,
Linus Walleij

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-for-v6.13

for you to fetch changes up to 54b6c3795484ed2f5e63a66267cda8611c87d3cf:

  ARM: dts: Reconfigure the MC2 eMMC interface (2024-10-21 13:31:33 +0200)

----------------------------------------------------------------
Ux500 DTS file updates for the v6.13 kernel cycle:
- Add touchkeys to the Samsung Codina variants
- Re-work the Codina device tree for eMMC

----------------------------------------------------------------
Linus Walleij (2):
      ARM: dts: ux500: Add touchkeys to Codinas
      ARM: dts: Reconfigure the MC2 eMMC interface

 arch/arm/boot/dts/st/ste-dbx5x0-pinctrl.dtsi       | 49 ++++++++++++++++++++++
 .../boot/dts/st/ste-ux500-samsung-codina-tmo.dts   |  1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts  | 27 +++++++-----
 3 files changed, 66 insertions(+), 11 deletions(-)
