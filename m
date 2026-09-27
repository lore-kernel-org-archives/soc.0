Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2373B3884
	for <soc@lists.linux.dev>; Sun, 27 Sep 2026 21:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790544085; cv=none; b=RXQqf5QD75MSypUa9ZZJxSPdLfTzFF3v/MXMx58+dj+yuPFvqF/Gcm8gOb9lUIQviUpdr3CuAn2g/pEqYcQP0jumG/ax7t38A7ioAr3pntp0gO7Q9/f+2TwgV9jwFqnQeD/I+28alLBjNN6Xdm/Jt5BwXoe+9m2wmNrk43qR45g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790544085; c=relaxed/simple;
	bh=ASDnEK6WVhibOT9fXUjqS54e00LrF3huC2noS9ygIrA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=P3zkF4rgere4x4y4ycu7yRYyeI0VS8l7g5DYz/+6xsJQ5Z9Ah/Z0shzZGdRyKeNl+gemzF8BCMRbbcEeVrbqGMeAaE3RwWAKpcoPfvavl3nWomebbeHtFxayiaMIaaxU3G/86kTOarTKhVqsd9XK9Hp6MdEhiLhQ9lxDEoXi3tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alA7WSiQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alA7WSiQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B701F00893
	for <soc@lists.linux.dev>; Sun, 27 Sep 2026 21:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790544084;
	bh=MlWJGwAK7s++BSE8UyIbisw2komC/Mbq7iN3EgEn2xs=;
	h=From:Date:Subject:To:Cc;
	b=alA7WSiQbysrZXMl4mNJ+FoEdsxL96p4ZBp3gUltkPYrmzN7WSWtpzlaFMqL5DQ69
	 zQhYVYVZHepJA1yKu+CiUwm6IIGB1TRkgoLYCa5We4AgS+SIgHbcaM8747OJTs17aG
	 toey8TpZ1Ot/Rl/88dm5J+7Z01IVRL0k3bq2WrLaSNQ3fPf05Nu0u5viBBFo7snZTU
	 mADsbf3hbhq5QTn+vZUhJ1wkmBMbnktH474+7iWnWmBtoXwcOfjlYprHNEk2rN3J5V
	 qdm+q1w3TdaBXuGNV6Zw/IJp7nOOyqvEMFIqFWazKwhT1mJsMKi7uYZ1+U9E/kT7tC
	 wz1cxQUE6J6GA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8f80e3f72so467220e87.0
        for <soc@lists.linux.dev>; Sun, 27 Sep 2026 14:21:24 -0700 (PDT)
X-Gm-Message-State: AFq9FYJH+uUIrsgIirc6RpCIgUSa6X5VUgj6hGESfwo1l93wffnacrsN
	mwvEfs9F6jHIsO4nlt/5TuA6VwVV8bXkDuB8p4soN6/l4blevWpGRdkNmlgm+uJNAXr94hA/C85
	ycr0Mkq2Q+r34Iowz8KoRvtHN+YbcGk4=
X-Received: by 2002:a05:6512:104a:b0:5b8:efa4:869f with SMTP id
 2adb3069b0e04-5b8efa486e0mr1579469e87.27.1790544082838; Sun, 27 Sep 2026
 14:21:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 23:21:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLnPdC-LjiofpLFHHh+BqWUhwmE9ee3xLk1gsmRD5r7wHg@mail.gmail.com>
X-Gm-Features: AclHuK_6hRljQ6deE-ZL_zrAt4pG0cHr2GN7Cl3TOwa9PlmIC_S0tPFfyvHV5uc
Message-ID: <CAD++jLnPdC-LjiofpLFHHh+BqWUhwmE9ee3xLk1gsmRD5r7wHg@mail.gmail.com>
Subject: [GIT PULL] Gemini DTS changes for v7.4
To: soc@lists.linux.dev
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

the following are two small DTS patches for the v7.4 kernel series.

Please pull them in!

Yours,
Linus Walleij


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/gemini-dts-for-7.4

for you to fetch changes up to 5bf1bb010712bba28eda926ed453db3cab91381a:

  ARM: dts: gemini: Use a level-high interrupt for TVE200 (2026-09-27
23:13:42 +0200)

----------------------------------------------------------------
Gemini DTS changes for the v7.4 kernel series:

- Rename a badly named power controller in accordance with the
  standard names.

- Change the TVE200 interrupt flag to LEVEL_HIGH solving very
  annoying bugs.

----------------------------------------------------------------
Khushal Chitturi (1):
      ARM: dts: gemini: Rename power controller node to poweroff

Linus Walleij (1):
      ARM: dts: gemini: Use a level-high interrupt for TVE200

 arch/arm/boot/dts/gemini/gemini.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
