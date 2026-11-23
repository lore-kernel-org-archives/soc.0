Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795450612;
	b=axFrtG94p1+2Dpl5v2DA/rARolgEyQK5RAKy0k4A2EUgIsra2UMPOe0roKgzcd6YT+do
	 ut5tR4uPWtmfP8VejSdp2cvDo6Z/QKdv0eqnzGuuGQXVKuStDisFZUHUWZQEA+oruf71e
	 gfo1FGAPxD+Ezok10WLQXDYT1wcvjZmai83+fvN3J0ac4dO0RPEl0PzPVdJnPwZUBU7/a
	 14dCUgsC263OdB8Ad/OsDPTpMhWrSVepFIL46AU0+JGqBQ8ZVR/apn6HyoOrkFDylFkII
	 MdELJDBuN1Y4/I/0g/HdvuSdBiTIzVUt3c7yJc4L744yqPJCkJSJeEdeSifeb1+pvxA==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450612;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BLsGEf37HdqkCO9CHK6BxotQ7YvjkNxktfNkt6d5XB8=;
	b=s+iTX9ADu0vjHGfWzXkbzmr6fAIi17GIxnQkldAOh/5KaOjQTuN/L9g4b+6/yNH/bdr7
	 BVMGBjqeJUKXVQD7IP4ew4WV0JfhITOc784CbDOJpnVdM/5sJ0ZEA7lYCDEGLwta5g+WT
	 spmMRF+2Xsjz6T2MlIK1Si5NphP5/3GhKsOPZ+g6gYLnxjXNWfxVNtEIw7cqJima1uri3
	 +7lq3/GpgGq1wBLlMRtcqEdwm7vibajSyVMzSqp9vS1yZHh40no5dEXgLeQ+7Z5mQV2ax
	 HgSEMYIEYgJU9UF8t3o9Zo8BJ1NGMUSKhEDC1O/Zk4qZjgU3+YJO3bKGAgS7VT5URrA==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=SWva0iSU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDDE606A31A
	for <soc@lists.linux.dev>; Mon, 23 Nov 2026 16:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=SWva0iSU
Received: by smtp.kernel.org (Postfix)
	id 0AC701F000C0; Mon, 23 Nov 2026 16:16:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1795450611;
	b=cNYlxaUtsmaIYnQbTo/aLqZ136hc1S+25U8WKhDdrDks/TbkJvuMD+pgvFhMFJcZjLOR
	 VW+PZ6iyy9z0xVPZxmmer8sIoJ1QF6wv2FBIaysEyEPh1cFK3IUMzUihISgqBqfMsvzhT
	 3gMnNjixz1vC67QNfoY7XC1LdfDtS17p3Ss7dJvQiZBD5g6Mx+p8pgEUieIbKVKM6ieLQ
	 nr11a5I2HfvzNU902B2bhspaCPkehvKL1c07x8qUTfv/h5zp6sLoncuerpsfIJm+KWzhe
	 axNq0uUfhUqt0C8jbbYhqrj5RTDAMauYxOI6IymsQx8NUbWA9oobs0s3VnL/zAj4OVg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795450611;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=BLsGEf37HdqkCO9CHK6BxotQ7YvjkNxktfNkt6d5XB8=;
	b=GtCb2bwe6nZRB2YfWItEbbD1do6+rrH30jsnCT8w62CmOFysSfmxSwJgS8oW1c7jj2+L
	 1kyfuIDPsZsVxlY2vBLQywzXZWHCZQVRwUYWYRTlySL29pfVlONNMNXvIJI7FLdZkjpsG
	 nAfOnUMYvC8lrvlK89EdEKBO60vUuvPiS5lChO0RFGLQu38eqEhivgR60UYK0CDbnvjaT
	 YhKKnaMh2AkwESbk8Rs2NiHEXdHS5tfYI83ddfKb0mlHdgBQXHHZP/NQ8yd6s/7zz3gTO
	 ZODQlitfFNQzpHzlN+5PNUttT47zMqAnhx9D3mYSouDg8hS70A9aeQyaxKV1kz+t0Dw==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=SWva0iSU;
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 555811F00A01
	for <soc@kernel.org>; Mon, 23 Nov 2026 16:16:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=SWva0iSU
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 555811F00A01
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5A29B201BD1;
	Mon, 23 Nov 2026 17:16:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795450594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BLsGEf37HdqkCO9CHK6BxotQ7YvjkNxktfNkt6d5XB8=;
	b=SWva0iSUNtiYs4YrPQWnIARdosnn8kP6je8hSuDShfH3F9Npjs9OfNBjXqDJgTDYWrKUiJ
	Xum+YJQ3SCBa5DxyyYIkhBq/NRgkRUzcqZIC0862fUGiSrN35O5SE+PwdEUZSeBAmRGmz7
	i9WPKihCGV2o0FkxSfOLo3qPsDPdCjABp4St86ZTRysblRRV/giP8VQP25IMftDHghk9Xg
	NRTb6Mo68R0eNCV6fCJX7lONkrtO/kUPna36IZW27iKnMYxkQizEvjmT9zuD2HhKOHV1Sl
	q/Dv+6UrPIRMf6GhrxV5o/JRNduQVvLm/SbMOvpA32oDNxyYjWAjFEJK+ZaZug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795450594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BLsGEf37HdqkCO9CHK6BxotQ7YvjkNxktfNkt6d5XB8=;
	b=DEZaqBi+jXR5mGvun6InCSvE7U4qhLHmeUXU/iQr6vA9g8sIcZWln0yWy8GgVhC+cJ8pG0
	7QQyXBXW772MigKfVdM3332bhCCIEyCJb2HIzFDV7qR4CNh0FZ7BSUyJ/DOQO4R1Xs/Pig
	DTiEBrfxLH3Xjm7xlO5fbQRewheL2fKTc8P89Y5kpp85Xw+mdkQVaHMDuOmufiOkDLzUeJ
	/7qUYhF2yvJbPcSnYNp5G6OXAHKr5KBzRqS5EOAnK9+zLOpcsWLo1OCBOolH6m3e/XQwYj
	z5gn+DMXSFTC2LrTpfcOs/qgKPT0rKEKyHP+alXYLX7K1C5rLDZu2yTsXXUA5Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795450594; a=rsa-sha256;
	cv=none;
	b=HxZnzLVHqrzsWwA4xfLcc71u+2EqTjHcWcooufCQQRNXvkEGipiy6wBpZbN4NaIEzonGWS
	+xwgrhxR4qvzKCvsfPMqYxI5ks2Lsfi6Sk2z2jZXafmLuR8Nn4/VtzOOfEKyPStYNXeVJV
	0efbsxG8TxdQLuKkzr2m9lGgnf93t3Ws0KVTFY7ecI2EE6RqfY+jQxn1EpBGFZsiAsmBHm
	jjcvWFfSYk+edau4TAu5PJ8XcNf+u/4RNJr40M8pTrl1cYshocxpc04ARRJYyOdKQwonrT
	VFQtruvDqjrlcNGbACtFmDge72ABT5tzii5t6I9Dj4qQPdJVpVClllghZLTD7w==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xVWiX-0018kP-2S;
	Mon, 23 Nov 2026 17:16:34 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v7.4
Date: Mon, 23 Nov 2026 17:16:33 +0100
Message-ID: <20261123161633.2530037-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear arm-soc maintainers,

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git tags/reset-fixes-for-v7.4

for you to fetch changes up to 586a87701101ba11477c8b5cdc1528413318ab77:

  reset: core: honour optional resets when the GPIO fallback returns -ENOENT (2026-11-17 14:27:15 +0100)

----------------------------------------------------------------
Reset controller fixes for v7.4

* Set up dev pointer in reset-scmi to avoid a NULL pointer dereference
  in case of_node is not set.
* Correct the RCPU2 PWM[0-8] reset registers in reset-spacemit-k1.
* Fix a reset_control leak and a lockdep circular locking dependency
  warning for reset controller removal edge cases.
* Fix SDIO WiFi on Anbernic RG35XX by letting
  reset_control_get_optional() return NULL instead of -ENOENT for
  unsupported (#gpio-cells != 2) GPIO resets, as intended.

----------------------------------------------------------------
Hung-Chun Tseng (1):
      reset: spacemit: Fix the RCPU2 PWM reset registers

Kunihiko Hayashi (1):
      reset: scmi: Set the device for the reset controller

Tzung-Bi Shih (2):
      reset: Fix reset_control leak when put after controller unregister
      reset: Fix circular locking dependency in reset_controller_unregister()

Yang Siyuan (1):
      reset: core: honour optional resets when the GPIO fallback returns -ENOENT

 drivers/reset/core.c                       | 71 +++++++++++++++++++++++-------
 drivers/reset/reset-scmi.c                 |  1 +
 drivers/reset/spacemit/reset-spacemit-k1.c | 18 ++++----
 3 files changed, 64 insertions(+), 26 deletions(-)
