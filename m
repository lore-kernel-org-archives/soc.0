Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405F8179BF
	for <soc@lists.linux.dev>; Thu,  2 Jan 2025 17:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735837627; cv=none; b=WKTIR4sN984GQgW3/H4pkTbgJ5pZUTdA7e59R3UlmwubfXrFrw7wSl95Yn4AczwH3hI6IUx7Wi02z2dMYGWrd6PfZ8K+3MpxiNZ0L/rG4uK4HHxXGUmo8nAUC1Pl67TttuPDNKx+3IqBCMyoLugQoNgL4EdJ5uHKPqcXn5KprKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735837627; c=relaxed/simple;
	bh=A/jKLLQ2J6Fyflbdq5Kq++6Lt6AAyiFrnl5swhh3tK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sgSRUWyxhcuGRFE4+SHgAZJjB1YhQxt2s/Vxdhk4vdvhl9Jn9jOQnWzL3LOhDB6B+3xA778fORLJ0k7/fytYNBsSwFNFym0xB1BKGKMWCRR+u7O9vuw8jyZE79hxqQJPLwYBk0wtokHVdya9KE4FrdQWtV8VzH2PaU0Q61TsGrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTM+LxJN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTM+LxJN"
Received: by smtp.kernel.org (Postfix)
	id D47AAC4CED1; Thu,  2 Jan 2025 17:07:06 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C8D15C4CED0
	for <soc@kernel.org>; Thu,  2 Jan 2025 17:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C8D15C4CED0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d884e8341bso83921686d6.0
        for <soc@kernel.org>; Thu, 02 Jan 2025 09:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735837624; x=1736442424; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uF6C3Uxwx3s0wLTIUnGZktBanFJ1okTxJHcx44bIDLQ=;
        b=FTM+LxJNfyP5KhX+cuBmAgUHkm7ciMQvVPIyyS58cY+gIA4u6HLhzsMSBoHc7Vi+YG
         L2/vEVGdGhulJClPlLcSUOQr17g42VdXD9QhBsGw6YJ9WCSlp8aEyHzZh55vFztaAE9u
         xUY77HJeCPxm91B6FUhe31QyMsFX1zzuRTj+lCTUH7w5tB3DymkIkFm9PGKUAQyrhsq4
         GKiKrZqPF+XJc9+nu6dctfZ4SNgvhXh2ejFu6FH5Bb1TpuoZOS/izUncTktXO6+e7Z9m
         f57qdSebtOKj0Rqc4+Z3+Gdg21eUA7bWbHjwhxkEMCYecNJbKL8eaZh1BeUHUzKXvusx
         hWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735837624; x=1736442424;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uF6C3Uxwx3s0wLTIUnGZktBanFJ1okTxJHcx44bIDLQ=;
        b=r6S38E7OybQ0J9bd2X7+Lk08A/iBgPR1KHnY856QGmajOWze34gZaHUvlewB8g+Y/t
         zIpvYV+tcMsezj1vkI9rOJTEAD5lLPdn9S1znVoZJiEx7rBLMEZj0peeorFCfCHSNl4r
         3AVGl5mvjzOuWZeW8QIFrNaoBme9elIBxCenUlzUkTjuvfJkMdkBOK9nEqOmgOkfts2I
         MQd/Oezt/tT8hm4GWCESA+h22oWl7zOUYRF5JplOmEnQUvmFCinFHDqyP6jHo2NZ/8NV
         lUXjKnl9KPIQvo5MbhyvTWJtAXZpJVWnzUk7d3RS+SLvSplUaDkZg2EM+vIvCRK58tqn
         PSng==
X-Gm-Message-State: AOJu0YzIUnfPmAschcF9enz9IhJmOq4JqWwsTvloiDkULQgvq8uiDGjN
	J/CwK7yIJbBILonaOry9hpLW9lBYq1eTXkFI+glPfbELgbPBvZi7h2v5JQ==
X-Gm-Gg: ASbGnct12tgT8cBHdiwG36S8p+lii7IpbaQhq7uu6JtKaTZpdQF9THDm/YYfeDxT8t0
	8G32GoIFVVnQcQ9SHNFNlXFxj6Vi2lw2z0GSb7iWrlukPenT1sNp8u2R5gDw5QkLe52rChzEEK5
	MbpuTMXCWxZXKBvEP6J9tG2djHkhIKeU1f1xcQ2BkXhASI1iendERjInLWVZyyPgB7Xvgo9aoLE
	IT1Om/blFFJjZx4fo+bQHmdP6oUbujp3Fw7H9YokR/LV5TB75kK0IL1o+U5mq8su5zJngkYdiX1
	gNnovfiRv9eJN5Xn
X-Google-Smtp-Source: AGHT+IEJSuglITp0TPYcJ05b3F0ySAnbLppzMQkCThxZJaMOx8J10QlRMrOS4nL80BA1aP3OKMPx6A==
X-Received: by 2002:a05:6214:29c2:b0:6d8:a258:68bb with SMTP id 6a1803df08f44-6dd23309affmr756811806d6.6.1735837624265;
        Thu, 02 Jan 2025 09:07:04 -0800 (PST)
Received: from glsmbp.wifi.local.cmu.edu (cmu-device2.nat.cmu.net. [128.2.149.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd1810e067sm132891486d6.45.2025.01.02.09.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 09:07:03 -0800 (PST)
Date: Thu, 2 Jan 2025 12:06:57 -0500
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Joel Stanley <joel@jms.id.au>, Andrew Davis <afd@ti.com>
Subject: [GIT PULL] litex changes for 2025-01-01
Message-ID: <Z3bHsU4mJYM0xheO@glsmbp.wifi.local.cmu.edu>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Clacks-Overhead: GNU Terry Pratchett

Hi Arnd,

Thanks for applying LiteX specific patches through `soc` in the past!
There's one patch from 2024 that seems to have fallen through the
cracks, and part of my 2025 new year's resolution is to figure out
how to properly act as LiteX maintainer and send proper pull requests
up the chain, so please excuse any mistakes in the PR below :)

Happy New Year,
Gabriel

The following changes since commit 56e6a3499e14716b9a28a307bb6d18c10e95301e:

  Merge tag 'trace-v6.13-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace (2025-01-01 11:22:07 -0800)

are available in the Git repository at:

  https://github.com/litex-hub/linux.git tags/litex-2025-01-01

for you to fetch changes up to 277380570a00b7f40703598a89f2f7e60b1966e2:

  drivers/soc/litex: Use devm_register_restart_handler() (2025-01-02 11:23:25 -0500)

----------------------------------------------------------------
litex patch(es) left over from 2024

This is the one remaining for-upstream LiteX update from 2024 that
has been reviewed and successfully tested against the latest Linus
tree:
	- drivers/soc/litex: Use devm_register_restart_handler()

Signed-off-by: Gabriel Somlo <gsomlo@gmail.com>

----------------------------------------------------------------
Andrew Davis (1):
      drivers/soc/litex: Use devm_register_restart_handler()

 drivers/soc/litex/litex_soc_ctrl.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)
