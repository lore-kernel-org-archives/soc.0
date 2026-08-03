Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBEF257824
	for <soc@lists.linux.dev>; Mon,  3 Aug 2026 15:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772352; cv=none; b=F8hF6bTLMonUd/EfYCIYckTNMErNZpsJlyBrbJkHXfCVXP43aNc1o/PnaTDOSnQvqmiFYDsrLSr20rJbF3UfcKscybh+PEDwvYt2g4N48+PGedtQhSj50TtaVAKafcFtmanxRN0oLqdGy4qUWQRiPalVCcntX5sVZcBy6zjJIPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772352; c=relaxed/simple;
	bh=NbziU21Uwf9tsF4qhJ7ycQZNrgAbD6aLFtsogDvDgwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kZcbXG6FIF9LE34XxZIYi3MKcBWH7wdWG8jIUHJbMZaL8qQwZPi8NsruFJfgtcFcMRjzRYlyvJtx7Q7XRTvGQqJLutvXLMi/2rjDQvCySnpEzKLZc8ecuflyHM70rXpLArcT7fv/lZpCR/mf+QVRF0eIWmcCepgjRje2OBid6qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=We9KXPSV; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="We9KXPSV"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38101f85591so24801a91.1
        for <soc@lists.linux.dev>; Mon, 03 Aug 2026 08:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785772350; x=1786377150; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oMGav3xJdmmSRTKaIqplO9a5WTwQJq0xRLfaVlj7k/k=;
        b=We9KXPSVqFKGS90JhGr9RMSWoAtb3yRjNstLHzE8V9imAdcykXDC7T8S3uVFQaJ+iQ
         d/Wx/OvDBlbjZ4T8GySRH+/vFfgw7FvRh3ZjFQIV8Y8jqcMwHK333Le5iMsHDm6YuDSi
         78tYoUHRFl4NkJafw7k1hduQPoCqmvzzfRtLn13H1RcnseHNW+1euJUW7vdFgoZh0HR8
         1OysPwQpk7ngjGlJsj7RHRo3dVagqxWD7yaE5ye8ElsVROmXoH+JR12rdDVPyD49U23o
         VXZjt85J3452ldSEtvqTBiXw4KRNvJuRPJWr3NGZ4eJbOJtIa82Iumg8aJydf+06E55x
         4yZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772350; x=1786377150;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oMGav3xJdmmSRTKaIqplO9a5WTwQJq0xRLfaVlj7k/k=;
        b=ovUvtajqu6Ua95Q8EBkfjn4KmI86RwHjKe4GyQq+w+eVU1Qf2ZvbZbMbSVWl7wjs0j
         T7zCOCs5qyWQzetHGIRTpGxtMcRz4SjwxhiUCMDd6elOGsywIs2a+a4J7AwTpnWeOIwf
         bLbjDhj9e+uaFJOozJby55IPM7whrrQWlKUCXs/q+BvUYABKXsWGMDlkeoFHO95g+OrB
         1IZonjIIa7TpQ9FUUDojcvY18sBGHjiG8PgCs1kHmbR7hb9Of7W3RWLV5N4qNMcRktg/
         kgzXRTfHM3bE3dYXb1TaGk6uMOfJUfe8wJ4JfKKq7XYN9fYXnmZeawTQLnYbDe3fx7Jh
         eHYw==
X-Gm-Message-State: AOJu0YwieY5tnLH9PK19BaNJbWKx6ulEiIYA9CzD/9PB9PhiSw606HO6
	VeV0/2A7iaA1Fkx2R5Pr+FzH+TdStPS7tU6hDQFzBxGKVV81N5skTEJ5bgeXkZPktDA6bjxYqsk
	B+asgVFWoSA==
X-Gm-Gg: AR+sD12Slf1rboTgGY26XhE0unHM6MpARj7UfXdR+e4nNSN2psDyq5GYbyzO6aRvxqS
	UYE1WZ+hVBMW+/YPp2+gbdonVwMJzMD9/xEt0tNhfG7dYrrjt6NFXFrw5WFHIMQwDsnGHHsrFeT
	8fTjakc+iJpDuS3ETapkfvP2TbgCdF/7vZQCo+RLMHveE+lanEtpuosKrJ38k0/3XeW0m8/+qsi
	EXAj5AS+us1S09rYbamlNFZDVGxhTIBBP5x32IngqCkD9b3qGf3ktbevu9lpv2WHmuLg3xJVvTF
	jfqXT24dXpHuP0GG5+3lzFqobzpuTVxU+gHhIcTtWBjocvhRARYI4sXkZtp8yGIFxPDkWFToBZA
	iU3Za3ZxYK1vZWWB/7kowApdhBSVZe6aBfig9D3Oq3KuJ5aJnHF5PRehCoHSFmBiMSqdvh1Ep+X
	W+djWDidwPl41yYnPC5ZjYVsmv8cmboGpoWPfs4J+HISjMAC5MaB6fv08CZg==
X-Received: by 2002:a17:90b:4cd1:b0:387:d5bd:622e with SMTP id 98e67ed59e1d1-38fece84676mr12015a91.17.1785772350215;
        Mon, 03 Aug 2026 08:52:30 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-38fb2b8c5c5sm3038440a91.4.2026.08.03.08.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:52:29 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc: drivers: omap updates for v7.3
Date: Mon, 03 Aug 2026 08:52:29 -0700
Message-ID: <7hzez3i4le.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.3/drivers-signed

for you to fetch changes up to 6342de0aed216b6df460b492ddb532b3e0ed16f1:

  bus: ti-sysc: Fix /chosen node reference leak (2026-07-06 11:42:48 -0700)

----------------------------------------------------------------
drivers: omap updates for v7.3
- bus: ti-sysc: Fix /chosen node reference leak

----------------------------------------------------------------
Yuho Choi (1):
      bus: ti-sysc: Fix /chosen node reference leak

 drivers/bus/ti-sysc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)
