Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A80396D19
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785877148; cv=none; b=ceKFenOVJbOWhhGd8dsm9CQImBLwsKxUyU8o7JfXl7U1D0gjYFN0cvaHz8mgcqbL/ghtfXkIX0iqGouI6JP66nwQHa2NlmrIyF8QIicPgBbpf+EJ97vj3UW1j4EJ2lRyyKDlSfVpfFbJ0jRii7quyhlDQ7Wpgli23xnR0v1u7hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785877148; c=relaxed/simple;
	bh=JjoN6m4QKEkZHD1T1Vd7I/e3YrI8/8UQ31uxeQag1qY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=rnVCLpA9hUjvZS8ode/vtjXz9kzGRcMrD0Ky+ILB5sjCTmzOZ8ErUfHNjo0o9mYuMarzLILU8P5hIqNPi0zdrc7sMr9F1SKEZdQP43cxDcDwCF5RRixZij3TKHRR+IM9ZzHskD5ef/SWWyHaG8A3UbdB6sKqK762KaKsCcQI8A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=ThNkzNFb; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="ThNkzNFb"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e88b60121so199732a91.3
        for <soc@lists.linux.dev>; Tue, 04 Aug 2026 13:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1785877146; x=1786481946; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=klo4OYgl2ae/+64RtC/yZmFCJ+YBDV0n58bvZSTW0jU=;
        b=ThNkzNFb7tZnv3SSLjwMTSEh4SWo2GtYROMcig083qJd36dx/TSLtGgSubuKlvELWf
         z70CB707+hRq7V1vfdPM8DkfGNl6e6QGMULc4bS8uLCTn6UDVyj90d3rpLfOVqeXvXZm
         IYCRauDFM3eGfNdeFb+4yZu7UQWYsiQ8c/nhM9fBEYzFRJevIq+XhwVpE4SK9jDRnq7Q
         oGH4oIHoEB3z+p/8AoYaXzsPzhbsdPVRKI9A1H1StebsAUOGiUy2FVQj3sMQ4z5zwj3L
         XeStlrptQCIH1AG9GBu7p/54RLhe25iBVMvCsZr/S4asoMQwglSN1z5g+MYwGsPTJUoJ
         1VkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785877146; x=1786481946;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=klo4OYgl2ae/+64RtC/yZmFCJ+YBDV0n58bvZSTW0jU=;
        b=VoLyg/8Hr9oDo4LKqo8PxL3Wa1yA5qqMxMSKlnsQLstoHeI/yakeUIpd/cXAQKjEJt
         qKLL+N3RoZ1b3G2zVW6scUvGbzz2TVXUfr9k5jI/oE4UpV6YDqnHgCr7lwXM6r1M0KyM
         qA5ANOQEYzziW3LoAOMbAPArNRf4uJAkUqudaqYMiEyZXnAm6cT5SWfUuPE8bbwczaIM
         DNxJWK2vsgGJ6CXq3a1ZFPnl8uCn6T0B1zfKFhEQUYn+AgxSNVjLONdgwgPxgr+Xovtp
         zf55l0PkWssjejKZonZnHFiCFCFyqdhNohMUAXq0tpQFVOZi4OIGnB0dHq3QaAI10Czz
         QMpQ==
X-Gm-Message-State: AOJu0YyWmsuj5vw5+enHe5a3eXFHkNd9rCjYO810EJxq3TuSS6jLELkR
	wfsrJePfb1fyoHZ8V3/eUQI9IEWLpPe0hZFDZmQHBPRUq6MARVVPAnzkIL2gTCxcKZDrSPEcYl7
	Zxd3w
X-Gm-Gg: AR+sD1008eNCI29Ps7LcC94DCWfEAMRhox2blZCXV0dl9WWeCbj6SyLWn0JjbgCFCAt
	Bj7GY1d8isaJnfzrbTcFDBXBSdR8Acql5G1YJaV7SabFGQKx6tgBjWWMBKmqJdgyhawuMnRR0np
	9oduTjSdgO6IOXSMv7p1XJKptxtAYX7Ex5KQn7hwotNIuyn4ToG+BAl9OPTc9WKE049L1jxUPiS
	qWwE/ryzZLWkYRtrA4gXCh/wJaiOJ+wqnHfNFFOo+GyPybaqsWWHCykg4F6V9sXAQWEfK3uQi89
	t+G6rU5CrI8EDJlKxoWKqTw7UBFaReTxE6gTWsYeBE8MZCIUFTrXSwnlqKDTnliBcvWHrGiIszG
	KfCPDrBu0znHUOhVtmbIq4zQyXV2P5k9TBNO/hSP0v7/ryMT+DNw2N6nMS278uwY8KeTemmD2Gb
	ilk3VxeI8sedFLcAEPD9Ku4C2XkPCrmKQct4ji4q6eMPA7atUkuFTXgg==
X-Received: by 2002:a17:90b:6cf:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-3903c559075mr1459863a91.8.1785877145943;
        Tue, 04 Aug 2026 13:59:05 -0700 (PDT)
Received: from 92650adf53de ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca6482e7sm6821059c88.6.2026.08.04.13.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIHNvYy9mb3ItbmV4dDogKGJ1aWxkKSDigJhRQ09NX0lEX1NE?=
 =?utf-8?b?TTg1MOKAmSB1bmRlY2xhcmVkIGhlcmUgKG5vdCBpbiBhIGZ1bmN0aW9uKTsgZGlk?=
 =?utf-8?b?IHlvdSBtZWFuLi4u?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: soc@lists.linux.dev
Reply-To: kernelci@lists.linux.dev
Date: Tue, 04 Aug 2026 20:59:04 -0000
Message-ID: <178587714419.6415.4839368342970024723@kernelci.org>

New build issue found on soc/for-next:

---
 ‘QCOM_ID_SDM850’ undeclared here (not in a function); did you mean ‘QCOM_ID_SDM450’? in drivers/soc/qcom/socinfo.o (drivers/soc/qcom/socinfo.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
drivers/soc/qcom/socinfo.c:25:27: error: ‘QCOM_ID_SDM850’ undeclared here (not in a function); did you mean ‘QCOM_ID_SDM450’?
   25 | #define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
      |                           ^~~~~~~~
drivers/soc/qcom/socinfo.c:428:11: note: in expansion of macro ‘qcom_board_id’
  428 |         { qcom_board_id(SDM850) },
      |           ^~~~~~~~~~~~~

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:80d6d59b3a78228d8a8668e72eaa73c873b0edf2
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
- commit HEAD:  81aa917982c10b9f2cd0dd767d7af5af6057d93d

# Builds where the incident occurred:

## defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-chromebook-6a724ed754179f15da9e53c2/.config
- dashboard: https://d.kernelci.org/build/maestro:6a724ed754179f15da9e53c2

## defconfig+netdev+nfs-root-boot+kselftest on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-nfsboot-6a724ef454179f15da9e5466/.config
- dashboard: https://d.kernelci.org/build/maestro:6a724ef454179f15da9e5466

## multi_v7_defconfig on (arm):
- compiler: gcc-15
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a724ee454179f15da9e5456

#kernelci issue maestro:80d6d59b3a78228d8a8668e72eaa73c873b0edf2

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
