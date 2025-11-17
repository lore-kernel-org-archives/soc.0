Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A03304BB7
	for <soc@lists.linux.dev>; Mon, 17 Nov 2025 17:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400628; cv=none; b=jTwPn3RVlUgSFU/OuXCytWdJqFgnWr0tAb0ZNyyogXpzp8tDKZIH3NmfOmP9utUrzMhnEULfIivyaesUeUyfdNW62ZpbTcZOp5EAqo9m95wQvQOZTgp7hnCc2XU8bApKGCL6/2TsJpGECQoqTs+8E2mg7DrjRbxyc2T8F8kWW9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400628; c=relaxed/simple;
	bh=qEs+o5CIyHf0ZNKyaxJr3YN9Ls7Oi8fYy8iYSoqh0w0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kMUjjl/i7//fHJJdCCnoxjFn1j8xGhBf811Ll6Ac0SpkiUFzRNBrilYhBIMN5IqI9iiDrdDTL/OZJzQHyLw4f9/7tPQwbdpnaOdPYSm+B7pMuQ/XdXkn7x+cGumTipsgNx/HTVJJqOhtifEvZFzuGfecejT+yshzFHvr9FcYRWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wV13ty9Z; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wV13ty9Z"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7ba49f92362so3366439b3a.1
        for <soc@lists.linux.dev>; Mon, 17 Nov 2025 09:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763400625; x=1764005425; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BByjwH6DP+Z4+u9FvWdxBfSB14chnUdtzQgKngoILck=;
        b=wV13ty9Zga/yT/p2/O4fc39iOqXmXelyl26xX5W0trSumb//ZMc+EJsW0yvgGkNIuy
         5TdSYgtxiglyMb188GcBj5DDMnwTa9DYkEkQIZIzOyFSDUDRosJgIvg9wgKYnapCSkh/
         mLoqIRcYIFRNbPAORQUIrc7gjjXg9M597lUjWEl/y9KNJoOG1AdzNMxbunKypFK2O7W4
         apY8mrLmdfz14kjMHsCDiIP+lgY27F0R4yzXT6u6dPhbR+kOx4ehq/kRTMJ887heNWvg
         7DRzklT+HwahneNFft2m7xcScD7H4MxLTL/vL0MmvUTU1lJ2GMSMcJM3vUCQdiaYySpC
         RC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400625; x=1764005425;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BByjwH6DP+Z4+u9FvWdxBfSB14chnUdtzQgKngoILck=;
        b=dHeQattvkEjLeoH6M86lPQtb4s+4DQY5VeLZnG9Kcte95u4DeEkVJQ1D97KniXdW5f
         zr9E0hEyanp48fPqxn6feNagnbOype2j262vRmgm+FInqzd87xxRLSWduYJ9JDIactpS
         iVChlzKdTeN3Gp0WX6/ZjTUhwA29kv/BCuvwNzSIGGvgO5OiXuSQmRYwU2rqoqLo/+Av
         wgOwDg+en2lQD1i/nnybHZY0yfLNGdKreY79tE77IQPIvq9guGG3Fe5tmSE2Cqx1fHia
         E/yUqxJo6eF4pIlY/oY1qDs5McXF9NnekEdueCC+mBo/DuNc4bkr71LGk7JlafQP3+dv
         E7uQ==
X-Gm-Message-State: AOJu0YyxFAdeRIs6g0OfAol2ODKSQPm9EbFIJj1Oep41dO4VeFPbqnbg
	/smj+nI9d6qxXyieKDolc43qGjKM0Ah1mZ/jdn38rMT/8wGz3zAxHkGDSQUFKh7tyGcPM6K/Tf3
	b/2L99DI=
X-Gm-Gg: ASbGncusN3q4W1ojY8oetc1JOJSLpY7LJE+qArUSGm1kEamOWeKlgNNCWQOto4yh2kh
	ulkBSII1OfYOt0bdBgrUtVEDJgLxd2Ec4bmlM1Vc+zTuLjc8g7fsx0KodLVAJduBATIiEXmosfd
	jQbcVqJUjKAKtxv/ZixFa9C8j/5PzJVQawezq3mTEV4bI3nr1kNxU77nS72K/73i+E2MV+SC87N
	FIRIp1iD3zXto0u+vm8IgcF4wyOB758tMwM37Dlql4SATixRpiPOJzCB6DrOr3Sc9xN02LO7BJ3
	86gkrtcNeB9S4+KtTlM+zvQSD/RdVpNgehTTnQaCIDO6ZFpQWlL3eWjHQ1ewiqAxjWi82LS0OgX
	B9nQDNjYlKdl8786oiuXd/BJdLECAel34QIIt4KgyKpYSJRs+Trql+Fu+S+C3gYIB9kaPLIInj0
	G5JF7CGEW9h6u1BGJ/XRw=
X-Google-Smtp-Source: AGHT+IHbbc4k5mrkfMylyT8qgfnNnq3tN3oQVQf2oywmj0nq47cgWECuGlPIaeZHCeK9mw/C6man6A==
X-Received: by 2002:a05:6a20:12c6:b0:35d:6b4e:91f9 with SMTP id adf61e73a8af0-361171ca5b7mr161369637.24.1763400623631;
        Mon, 17 Nov 2025 09:30:23 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36f61bea9sm12609123a12.14.2025.11.17.09.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:30:22 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc/maintainers: OMAP updates for v6.19
Date: Mon, 17 Nov 2025 09:30:22 -0800
Message-ID: <7hqztwk1n5.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/maintainers-signed

for you to fetch changes up to 517d066dc080fc297f1ab5e8c6fda7c59d48ef8d:

  MAINTAINERS: Add entry for TQ-Systems AM335 device trees (2025-11-17 08:53:39 -0800)

----------------------------------------------------------------
MAINTAINERS: Add entry for TQ-Systems AM335 device trees

----------------------------------------------------------------
Alexander Stein (1):
      MAINTAINERS: Add entry for TQ-Systems AM335 device trees

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)
