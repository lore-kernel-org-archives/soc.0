Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECBD23AE87
	for <soc@lists.linux.dev>; Fri,  7 Mar 2025 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364620; cv=none; b=ZfKBylfqozE9Ymn/Tr0WHXTJujcC8bU0lQKcR94Mka4BVQEqESdxW5tNLVduk2QLkqcIyQPiJMRBLkuXacrZamPn6mI5dE8p2JxI/CC9HRf+9XY7gpHpT5kGyHmu/jnEY6ygC5OlJB1KjROzOwIsKOdDoBOcsVun5XFi4Hk/JSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364620; c=relaxed/simple;
	bh=r5MarquICTszAhxnmdhb6rx3NaXRVJ3u+/mVlIeOe7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wbs/slOUe63Cv4dSRsoEKLSZmcdlp5wMNuoWv1e0aPphWZ148Xfdhz82/cATbAzZydGggefbQsNXns3Pm1yWD0PpasbpD+jdRKajYnR3aCGOSwIpvv5OZvvp7PlTLtjFBhJVNRFDM8LchoEapvBs1W2IRokY2yeKx5owM+4FhFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huL1sSJA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huL1sSJA"
Received: by smtp.kernel.org (Postfix)
	id 6EE99C4CEE8; Fri,  7 Mar 2025 16:23:39 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 770EFC4CEE2;
	Fri,  7 Mar 2025 16:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 770EFC4CEE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3911748893aso1487604f8f.3;
        Fri, 07 Mar 2025 08:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364616; x=1741969416; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bC3W5Jgyz8sK+kS8zy3FrVrbANi0rcZdKDzcMLG0QyM=;
        b=huL1sSJAnWcnqoX9JhqKZJQ+jpIzfX/sgAvPSe9NW6kCZxf/L1QGiHmOoEBw2QVIGX
         Hf+XjG00K6gdNfw4FLWp0+N1Z8F5H/JP+2rhePc+GMNY16CbnGxCWiwgzBBgF83/N5Fw
         XbUpaRZonwvFKpdQRz+q4+SqqIeozXnii9ZTEYWDSdGSz9J4Gtfy4606sgm/Qg3t7oWl
         vmsohXAe8h0BIBN8pqGjswJWtKuosRkNtQMUGPHJfE2tw6MslHXRw7AJBBhntdEdGmgU
         +cVSgw4u1Ne16zK5vVzMpejs0WnbtFq1Y+XJnxp8FgjHfNuD2wD9TFjeRHP70FxEBVsS
         UmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364616; x=1741969416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC3W5Jgyz8sK+kS8zy3FrVrbANi0rcZdKDzcMLG0QyM=;
        b=okCzzAO4pJi9nAX74//6D46HyBEwVJfk4Y09dciDbHJjoyF57KNgZ9SPT2hSJe8Vpz
         fJWXuIjBt3EuccSeARO0W0RP4z0B/+gqiVg6M8B4knd6DTeXc2Vk+OkMcTDbnN2RW8C2
         SNHX+FQ7rLltf6f7ckuAiae7KAg/NtReBJFjTghRC7HRnOiZ8PT9RVkJMUl73R6q/WWT
         PN1xW+QgWLGtuAo0Yuuu9OPrthfVQhA6XsdyiYcGp9+PNX16twTEXVhIaL4HFK7LjhF4
         gb9T1L4XR/98AUgpx8cbcJ0HPkLRUvSq7SChMF/bC0Fc+NJItpc7a1vqsVp0S8Jzoyxm
         JVPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUouzHXTDdcKeaofZcXj4hw5g7LVOAHFkj+vuLWO+D1pQT7Sxh3QMnLIeUrWAA4sA1sTi8=@kernel.org
X-Gm-Message-State: AOJu0Yyiw+qJVGiPnIWvY/qLCG4ohDTLDotKcAFNByLjeRcEFBXt56vL
	GtAQuBoEkyZ7yTNTCOQ8Ah9XsKTHBE6xhBrVPSLgkIFD86yqgOoNgdJiUg==
X-Gm-Gg: ASbGncvRVaRIwwN60ZQ6fjSSWeMvl9/R8iDvFu/HjhMfB2AHCyJPxy4mC0yKiY9aC8/
	WIYEpi9vFk2Myc3ljvR21+xPKlyfHB1msGiZLlP33enfV3ZYMMvmdEExZuDJDxDvcXPeOdV3dL4
	l7HM+NtMeEBRHV8K28iuFNAojUZnevHBLJ7ZEN4ElpNo/OonyvCcTpLH1FGaXn43FWudKvln51y
	TeOnWnlRjt5iWphkz2J4TS0y+remuZhF0Z9WbTPh+yW0iAGG3rrLyL+9/4qGi3nl1PNaTAX8Bp5
	b8lznEF/uUcu71aloHtnTeO+sQND+OJfHOO8PYsomY/TGljo6nB6lyvfgeqAkQy65IgVsnn307w
	xFQe5SB0R3awJ86asZBkb67x66GzDv8dyPCdd
X-Google-Smtp-Source: AGHT+IEebjr3w9CsyhbfSL8ojkUic5W+TW8hWHGIa3t/IyTg+mTMNhqyhq716AMCymk8pTN/S5VM6A==
X-Received: by 2002:a5d:5f45:0:b0:38d:d9bd:18a6 with SMTP id ffacd0b85a97d-39132dc545dmr2401035f8f.42.1741364616020;
        Fri, 07 Mar 2025 08:23:36 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c01567fsm5706991f8f.41.2025.03.07.08.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:23:34 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] firmware: tegra: Changes for v6.15-rc1
Date: Fri,  7 Mar 2025 17:23:28 +0100
Message-ID: <20250307162332.3451523-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307162332.3451523-1-thierry.reding@gmail.com>
References: <20250307162332.3451523-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.15-firmware

for you to fetch changes up to 27321c788b3aa238af3c3234dc722a30b62d8dcd:

  firmware: tegra: bpmp: Fix typo in bpmp-abi.h (2025-03-06 20:02:26 +0100)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v6.15-rc1

Not much to this except for a simple typofix.

----------------------------------------------------------------
Zhu Jun (1):
      firmware: tegra: bpmp: Fix typo in bpmp-abi.h

 include/soc/tegra/bpmp-abi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
