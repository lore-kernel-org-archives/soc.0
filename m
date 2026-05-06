Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3047315D40
	for <soc@lists.linux.dev>; Wed,  6 May 2026 19:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778095415; cv=none; b=qhWzfKoOPp5oli7LyaGpOZqqHy4fd4y08CPo4NxjpKVmErbYsRUMni2MmICo92T+Apr6iCtQp9MLhElHXMIQI+AY5YzEA2mE/jr0jGzZVDj2VNCOmR2+4RqNkI2bcKqbi7yxFZ7hmFoVr95JU+Rf1kLKilChuBPGmgZAEXjnneM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778095415; c=relaxed/simple;
	bh=Cz+JDK+I4devTSWDLG/D4h7Dy4wTb83Ppo9SvYBL5t0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BVOXnxb4Bg8TN5VbnpsJ+8m140KGdMQl8jkSM8wlsxtfpc2gFRxylXrbuOcJevdr+uAes336VvFkXQsypayemI4umVPbLiYiwxH7GXrNTwQfIbrhBxmgtFfGbmsHqiL/Fq7nmyjtIozsV3JdXFjzfZU65gudnAhvvuqIZDnqWYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tJ6e146f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tJ6e146f"
Received: by smtp.kernel.org (Postfix)
	id B783EC2BCC7; Wed,  6 May 2026 19:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B61C2BCB8
	for <soc@kernel.org>; Wed,  6 May 2026 19:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778095414;
	bh=Cz+JDK+I4devTSWDLG/D4h7Dy4wTb83Ppo9SvYBL5t0=;
	h=From:Date:Subject:To:Cc:From;
	b=tJ6e146fV+ZQvoVV6LegPt/BEufoQolrLzNAHKBpFLaBBsaZB9IADS1coBMH3jTKY
	 xLlWSp1yzdVBzdCNyzXtBDVuYbsUQxUG3tDGSsgB4QX+y40p/dW5jIg8zN4qpexREc
	 inJdwEDgOVft2ekVSVy+/KIyN3zKzAMn3xfVC88Mbp2oi3NZUsSuas9EaVgn5yOJfF
	 /yfzHLAOD3sHuWUhy5IQ17J9cfuVIUxEMU8ALaoeG3PDb38Rddvk9uV79UJlT5j9m8
	 l+t64yYTMP5TSdwqsxAF6g58nJGUg7YTzkfzbJl9orSiKeO7LvkahMqDuaDpSes61N
	 ssBc57owWu4Sg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a87782588cso5049599e87.3
        for <soc@kernel.org>; Wed, 06 May 2026 12:23:34 -0700 (PDT)
X-Gm-Message-State: AOJu0YyZuz43onnkZ8uMRx9VS5RTFxIDY679MUzN8Br8ut3v3uX2IYEK
	FLJt2ug68TW3n2GT4BspwTj543mZ/6Rc9Mii/1Enrz87TE7DV1SXerMyJlUsNNnS8LpkNcmBtxC
	hDIggUKqqRaOV/KTbevWYkdZgGTBHsnU=
X-Received: by 2002:ac2:4431:0:b0:5a7:3c4a:cf2a with SMTP id
 2adb3069b0e04-5a887cef23dmr1219468e87.37.1778095413309; Wed, 06 May 2026
 12:23:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 6 May 2026 21:23:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLnf-3JivT-7MtCdnx9DRG2MMvvZWcsFdLxWM6416Nr=qg@mail.gmail.com>
X-Gm-Features: AVHnY4JQWNADzo0VGR4zd-NnvJcGH_duQNeN0hK4OQhjPFwjCxLDqJCznKDwmPQ
Message-ID: <CAD++jLnf-3JivT-7MtCdnx9DRG2MMvvZWcsFdLxWM6416Nr=qg@mail.gmail.com>
Subject: [GIT PULL] pinctrl qcom defconfg changes for v7.2
To: soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, abelloni@kernel.org, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC mainatiners,

this is a split-off of the defconfig changes affecting pincontrol
for qcom platforms in the  next kernel cycle.

The changes from the pinctrl tree cause conflicts with the
soc tree, at the same time it is nice to have these changes
in the pinctrl tree for coherency.

So I:

1. Split the patch in two, where part (2) with just defconfig changes
   and applied the rest part (1) directly to the pinctrl tree for 7.2.

2. Created an immutable branch with just the defconfig changes
   in part (2).

3. Merged that branch to the pinctrl tree.

4. Offer the same to the SoC tree (this pull request).

Please pull it to the defconfigs branch for 7.2.

Yours,
Linus Walleij

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/v7.2-qcom-pinctrl-defconfigs

for you to fetch changes up to c8aa5cf994bdd664d4b5efa4c952ce5ff864e351:

  pinctrl: qcom: Make important drivers default (2) (2026-05-06 21:09:03 +0200)

----------------------------------------------------------------
This is a split-off of a patch that was applied in two parts
in the pinctrl subsystem augmenting Kconfig and defconfigs in
sequence.

This is just the defconfig changes.

This should be pulled into the SoC defconfigs branch for 7.2
to avoid conflicts in linux-next.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      pinctrl: qcom: Make important drivers default (2)

 arch/arm/configs/multi_v7_defconfig |  8 -------
 arch/arm/configs/qcom_defconfig     | 15 ------------
 arch/arm64/configs/defconfig        | 46 -------------------------------------
 3 files changed, 69 deletions(-)
