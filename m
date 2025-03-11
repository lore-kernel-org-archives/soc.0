Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B0F25484B
	for <soc@lists.linux.dev>; Tue, 11 Mar 2025 11:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741694251; cv=none; b=nNIWircqKhDjZgBHJ8PvkyWDN/ayF2EJebxoroL2PQxCmwi36THcN1Lo9K+tMzRgphfkX/pcnlSW0AVDgJ8yCmp/OC5hWiy6vX53KBJmqgzvWi+w2VGvv/SMIekveuWZMqLoS6yjD8b/+bsJtQabcEhYnsOozaGOo5U7HBcRjdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741694251; c=relaxed/simple;
	bh=llYUu9bppDXRU/KNY3w5uwkgqNKET2ICKdOJEUIRbVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jlWyyG+IxuPDCGFS8YtgwByfbCSQNXs2bFg9vzjrgIEc6x+x19+01FoermghDS1izdgCcPDR4MumnqBCkYXjWtpS4KyDv3OjyErjOuV60DHFit17l9HvJxjJjmf0X0hMmjm41IEx1xT3FJj7QPtLDp4twb1mHDgyVAAd+rjFRLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=F8m+9Huz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="F8m+9Huz"
Received: by smtp.kernel.org (Postfix)
	id CACD1C113CF; Tue, 11 Mar 2025 11:57:30 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25ABEC116B1
	for <soc@kernel.org>; Tue, 11 Mar 2025 11:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 25ABEC116B1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39143200ddaso1446044f8f.1
        for <soc@kernel.org>; Tue, 11 Mar 2025 04:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741694248; x=1742299048; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YwysEm8CgcGz0FLembVWmSDCiCxUvMJeL9Cn5q2MMGA=;
        b=F8m+9Huz1kxITZqnAvno3EkM9zo/lCq01GciS47DtTgntEaWTdbVa7+nm+m+e3jqEw
         uS/fXOHiXcDWUexIuH2wWGEowXBtBart2mwLFBtoBubf02ypKLeCPnxbeIiPMM5YLsUL
         Vo2ef1jR2Rj1K+ya8Li9sy11NJBgcdm1Zy63qgbpswDtVXtS6FFECjcu5nlJxvsWGNLN
         jkDo/kcoxF+jzJqUAcv8MdKmbWiHCUk1+gV5XCSPmDtCM7R7CQpsTXcb6EFElpArTh72
         LvIsRm0Nh7cBrFJVSetOAzxUzih2K1ANDVUk0rXrPH4LGukaLcZjMCj+XIGOeavluSOB
         qahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741694248; x=1742299048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwysEm8CgcGz0FLembVWmSDCiCxUvMJeL9Cn5q2MMGA=;
        b=XwyzSJw5WUKicgFJHCG4sTebiY2sWKNK714k9i6TzoUNYVkGuIwEfAnbtTPWMLSY+W
         V6Gb4oSnIzDpmJKoFSBgZoOp1cNBEplibyFXeqSfXAoQLePu0oz0ojRdEWu86v4rMJlU
         agf24GhmjYsg0gPB6obwZEvQKKdd+OeydjLCqPDkuNXuGggfTr4C2khvZzdmDBHzsMBX
         Tcgt1oVrL2pS8eTffXkJHg6EeWfftBCHJ9W8vVid2uo7qMxnPqnif/MVCLPEGVvaf6NT
         OM/7ycygLEe14HMQB57r4OjRScCt7MrDdM/4IEg+M7aMoYhjJVm7UEUoKw7uB2xWRLbC
         2PBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD0c233WGVpstaqjc4DnTwodYEEJOLEFFfusGM2q/qndps/t/URnz3xPAnMZZi8U8EZ4U=@kernel.org
X-Gm-Message-State: AOJu0YwGTGioMtRS7mRJhNfbhjopRNdPzLmuwo6cVXVlffpBcSm4A9V5
	wMslCDAccftp43NbHFuy/xwfepvSkqdqGEOs+AvyGd2vvTD1CeQtN7UviHv3Oow=
X-Gm-Gg: ASbGncvSmxF4AZ44IZMsJ9Tl8LXXV0pMO88Sj5nAm1NJNdonCOMmc7w/Ywru5yFneSa
	5VHJkKALWB5w9Z/t6hNl1HbJfDgJTaGs7e0fSP7kpmPTHSlnEJ21j/1UfT7TqNAVoZwgdI/MyVv
	WjoEsn5mIP9mNU+ztl8CM2jlXDYiLbyqfFLtm1M90TJ4bmdohwVXIxfX9bS3NFk/JvCLVgNX5Cz
	SWMYma5WtpgeNunwydaDNbBZwsk2WmW5GWbye1jI9CQS/k6RUtrEtXRBE0DrbSps2D2LTH52Y7H
	XNKqWNQk5b3rXef7/pvn8ThZs/CXgeEGRchbKkQgYrU5xOqNQjRJKA==
X-Google-Smtp-Source: AGHT+IH+VpDB44gnrhW+DLqQbZXEtOu1LVpBt7zvglX12x25lWmYvK0tB5Yg2Jsuzi/rc8ZMAGUcBw==
X-Received: by 2002:a5d:5989:0:b0:38d:cf33:31d6 with SMTP id ffacd0b85a97d-39263b006c5mr3918261f8f.3.1741694248428;
        Tue, 11 Mar 2025 04:57:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5946:3143:114d:3f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c104acesm18161461f8f.98.2025.03.11.04.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 04:57:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: arm@kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] davinci updates for v6.15-rc1
Date: Tue, 11 Mar 2025 12:57:20 +0100
Message-ID: <20250311115720.40053-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi!

Please pull the following set of DT updates for the TI DaVinci
architecture.

Thanks,
Bartosz

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/davinci-updates-for-v6.15-rc1

for you to fetch changes up to 58abc69e479cf5b36c4fc4287a11c9d92d2ce4b8:

  ARM: dts: ti: davinci: Align GPIO hog name with bindings (2025-02-03 09:11:33 +0100)

----------------------------------------------------------------
TI DaVinci updates for v6.15-rc1

- make GPIO hog names conform to bindings

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: ti: davinci: Align GPIO hog name with bindings

 arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
