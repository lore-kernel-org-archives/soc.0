Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B8137DE84
	for <soc@lists.linux.dev>; Fri,  9 Oct 2026 06:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526409; cv=pass; b=jg6XEpcSw8S/Ni4MUBAwcugMdzDjiZb0wdsu7QVW3j1Iaip377tKKFaNRt9vqaho6nOumZu+WPdn4JCwuRQ0IM7HCsMYwBYwgi0kO6B/w4SqyH3GM8u37AWqSu4id3Ymk0lGxyuU92dHel9fvskuqqr66EWfAbM3ma0ahZXDNlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526409; c=relaxed/simple;
	bh=Y3+LLjTIWMUm5k1wcmGQNd5ii4bKF97TRZt5r/oxyrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rbHlrqJ71VcqsvWdWAGHnKDQGsuf5SQyCQsH5KyvKmQfGKE+yt3kR3X2ZJkIMBaj9Cm8ts8dBsFa8y/T7s/CbP3iNPk1Mnz2ZYSX38Rc15dMVoFEIZGk2ZVts7xRdJrqkCbzS7JklX6FBEaU/QSrsS6fnQfRjzmQl1vUAsS7KVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FBNa4ckY; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FBNa4ckY"
Received: by smtp.kernel.org (Postfix)
	id D1F431F00893; Fri,  9 Oct 2026 06:13:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791526407;
	b=H0t3azRPW5znIotUw2g+69D9gi47Wsn765vZ3CThFyqkJzIFlT29fIM9QjRq7AxZ0GU5
	 vVNunlvnrjH2KdpkKjudSjsCbLmi6QWKFPLQRn3SFfcgcEnE5xN2mqczx/DaKPv/gw+vH
	 wqo0UoyTe/L4z1Y1UlKT4gAmSl29ewxgyvYmxObx5fGIuS7bE3r35V/ievQYwdRF4hZIt
	 UpllklOFVR0FBte/ykY+5T2jDWcdGWY5673eeCzHs0AJfC7zXvx6lYCff30IAZkAj8LFF
	 KhAW9BqHMUm9oMCF//G5WZrEvvBytRpkBqHB72TbJNoMjhp0DGcsXOHDrHGo7zKifcA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791526407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=LbLj7fUNzpDp9YMNc8I7rTF77G8YpYO/de63oiZ9pDY=;
	b=rIEePopY2Q3oD6TtENB1om3m01XbhWJrixooSmTM6tSUji2DaHg7rrRQoiTBH0Jzhlr3
	 4aFSX4w8guBmqcdJZiwDL5NvR+KcscCRewlY+XEiN3nPZ30Tg2CtiwDheVRcTKUDZ8ofv
	 90LqzYkJddUuqzKEr6n1c/zIo0oJWKThWLcS0aVPAjsMUB7bYg4RLVBg2YR0MiW5Vetyr
	 nRCCWUqV+QRKXFAz5Vw1ofBaJYv/lPqG3ba6mpgKdMvse8PLVeHVRjO/VstSVKcoNNqgI
	 nMJivaehcEBF5nKpeu51iBDL3UdfafbdApMOe0N7ZD5elslpyYd9x7HvAWeSg0WqMyw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=FBNa4ckY;
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D754D1F00898
	for <soc@kernel.org>; Fri,  9 Oct 2026 06:13:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=FBNa4ckY
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D754D1F00898
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so34284515e9.2
        for <soc@kernel.org>; Thu, 08 Oct 2026 23:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1791526405; x=1792131205; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LbLj7fUNzpDp9YMNc8I7rTF77G8YpYO/de63oiZ9pDY=;
        b=FBNa4ckYGwcRNW90ffEx4FbUFWj1QrN5lp/HizQWxGqVQ6zoFh7zv9yEIwci1RGlif
         LeMA6WLOsfkaZ1UCfBDNK3S6e1Huc1WUm+DZFumX18vL2+66p+MHk8RHhNTjy6+Ozhmj
         /+rZKZ2urwwn0vmpLlQWbiCnqOkTJFi94zrdgaIyWIfzg+rtWO4cUBG8LmANAUN6ykbb
         qJluTXclceg5npX5oeCX5uw8YiWK63nu2GAGHVcEoVEFw7+BD6MZrNiTa4wzBdYMDZt5
         dc6l0cID7cRGrXu2cXqleYPUs5FFwtkZdJ5iGFTS8rXzJh4A6USbV2H4XW2/enMLUj1p
         luQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526405; x=1792131205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LbLj7fUNzpDp9YMNc8I7rTF77G8YpYO/de63oiZ9pDY=;
        b=uYCf6El0vG7sg5wk1qrOpP6gzS8ksFbDY/gJT2snfi1s1UlmBn9urTX2TJCWEoU5L0
         suP58ifC8TmupBjTIQxBu3lTSnqpwh2ENxJ1sEy4N6lgH6cexgK/wHIg6kbHvWBSToAH
         7vTZ18EVG/Om6OJdwz5TFA1Kbhwjw6zlkAFIsZstOqmoUs49uOxc/CkrLwk4OMf9t6NX
         oSrRhJZUq6oB44k8fkfbms2Yz1pbDd333DUdCSWN5IQ9f0whux3HVE1MrmGS1x674CJw
         ZXzI00bP1LXGhhxm1fYV29bvFkZnsk1+9MXUgGETR5qa5hFWWhMRX7W5GMTEsC20lZdx
         J/EQ==
X-Gm-Message-State: AFuF++lZTrG+HJyzh3Xu2gi60CkSqQltqt9YT2+8m5Yg0G2WH7S7U/eK
	P9YZ7ktkRR1wWG2Y421sRC9U4dXfWdcSCICcv2xv4lBMqSuaRQ/nrYIEiGE1c5oUhvLJhjk1vrj
	64z8J
X-Gm-Gg: AYBFou3/RtkDwBC4FLnhtx2SfwjzHSz7irQkxneDmdEYLbMFP1+UZiu6LMffCHLSkrj
	cbQWxJveCT0h+Jm9rc3oFxmFFguwZt39Omf+mw05PUSbk2wyOPtVH9RerQhv1EYZkdUBn1GwqAC
	6VRyaY5FuZb1BhDKs3PRVTozJR8k00FXGdsoPBEDAaaWMrP6NsCdrpf+HgGunPyjUe55AXlHkqC
	mbXaPBxvqhW+gvo/0t06hI1gwBNJgObJ49xloiSRuCMct7+Sm6+DhcqYdtyiW3qp4rXnUQsc/qI
	Veo87BOo2M131kupcdwy+Q+p9T4lR+P8QymPdnt3Gabm+MjFsw2hopifd+KlxfpSgriU2Aur4JW
	gfZ4cPBtiruooxWyxQN4DNtrQGb2cBbRkNNtTuleZPc1Tz3HAyTcYj+ncQneUtgQMW0pKKMgvRf
	G7zhrRpvRmHvltJ80/46DP+afPD1lIArC5+DZkktu5DTDpCBI7a+1Vas5E20U5RxjwQbLVUmBIs
	AT4BiLSDaKrDUiZpoqq+6CZboSoki4/ioa+YBon4+MboACk1qFtQw==
X-Received: by 2002:a05:600c:3510:b0:4a1:7033:5b55 with SMTP id 5b1f17b1804b1-4a18e4cc437mr14028205e9.21.1791526405319;
        Thu, 08 Oct 2026 23:13:25 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([82.208.30.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bead84esm33923145e9.13.2026.10.08.23.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:13:24 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: nicolas.ferre@microchip.com,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	conor@kernel.org
Subject: [GIT PULL] Microchip ARM64 device tree updates for v7.4
Date: Fri,  9 Oct 2026 09:13:23 +0300
Message-ID: <20261009061323.29781-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-7.4

for you to fetch changes up to 17483ea458ac0093982e8ce9fca3a8a30c4ee6be:

  arm64: dts: microchip: ev23x71a: enable QSPI (2026-09-28 11:03:19 +0300)

----------------------------------------------------------------
Microchip ARM64 device tree updates for v7.4

This update includes:
- enable QSPI for the Microchip EV23X71A board

----------------------------------------------------------------
Robert Marko (1):
      arm64: dts: microchip: ev23x71a: enable QSPI

 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)
