Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93A932E143
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 21:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785880748; cv=none; b=h/Y5ypJiFHKXA+CB0e2J8s7yPIBQRtXo3BjoG1k6X/k6Ma8mLuzIZDt3mA3nqEC42UmOAYMpQ3S/I+Mu2nRkAXfEUCKjCGuzZCz0v+FNxtMLZswFIMIG37YwNmWoI4iN+93f4jBOAlEBEEL1yPMhRtLruPcA/g/88bBe2wjbnSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785880748; c=relaxed/simple;
	bh=skXIFXrK5QAg8HwWhJ76Ww55zUM59/bL5VLK/NwCCKg=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=JMki3dBPdXzlbj9kvqdXpnJ0zQY/Y0CZKjE9X7sVcOxfS2SXdZDXreX8tKUrqN9VSD7d0RLse9NPu8edJoAJZEyeLd3LVtPp+UJA7xqosAzBBNIG0XNUvyOFZeCECv5+V8JJFAc/2aKwDZlsoJZ5XOw2FU2CNxlGnfgMpqnzdrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=f4jlGx/h; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="f4jlGx/h"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-848761b5897so215223b3a.3
        for <soc@lists.linux.dev>; Tue, 04 Aug 2026 14:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1785880746; x=1786485546; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jRXOKxfbYJ++E8k1q0YLh0Sn1iYe7cmNKDLkbVbCA7A=;
        b=f4jlGx/h3gfLVvPbX36ZNPbOJEoy0SLJEWxzmFo1x+2udwGT1Uvzk7P5HYb9B2agEx
         6i09zJUdzX+eMOGBJno9LIutU2lkPydpx6aTTvyRIcQQeIJJvUcoik2glMALitTWoFgb
         OJjfWZhhoCBL8+3NRgHl7ajHIhlFMKd7bsqD34qflHEAPhV9uymDShn93R72eg87nGVV
         oeU3PnrU40rHZSEoPtaZYgR+yroZ93e9n6wAw743WDwwXUDGcxei7DZMjclX7iJukgBp
         pxjPshNFFmBNmN9Qz/p1e58cpeIYc3mQ8cATNAxSbASDSfeaPQuODgMsq4w86scfMGm8
         m9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785880746; x=1786485546;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRXOKxfbYJ++E8k1q0YLh0Sn1iYe7cmNKDLkbVbCA7A=;
        b=tFurt9E2EZ2l9EWBMkzbnlYhd/9D/ShjfTfhPZEFpz4iIyjRpK1/x7OVb4rkBrhao+
         SIaLMTaD0lgDObd/iIfBccXNGOhMOh4RrfOdaIJYUGv9Tc3OhHLU8AI0g1gX0T9JFN+b
         XDa4avKbuau3J/j5Kz5TBKfFg0ssrd1dtn9flGdrnhQEXdUJTrRTBsR9Ux+H9Ao0fQpm
         MRgLe1vGe1F+PgUomG0/eikUJRWuzq9qEw2dzcbyHc1zsgqkFycZ1w896RQu8Yhm7e+n
         VZ8kCp4lGBCIr+PluPOCTFSRohSMfh181Rl/pcbFKT/VMSDIhE2yKwcEx5T4BIizTT4f
         Gcvw==
X-Gm-Message-State: AOJu0YwJOiYMDUomCCkWgGfTtoplxVI47JRpSpylIw/0AhioTz2CN71v
	d1lN4HtNHqb/QmvHHM9KI+gYYeFtJDmsE8/qe6oJX1XzW1fbXC2giHzfg/4X/e+bnm7sS4nFwYf
	sKidk
X-Gm-Gg: AR+sD13cpn1aS1oeKvCE/nOn3uD27sZ6LGusvPd4EPzymiNbwZa7Ged0hpNC6yDcdd/
	cp4OotgxJLqxXB5lUbOcVg6i1f1vTImYX0nltGg3/T9gtpaxVMxXvJZ/osXFT7fHJteYJmjOJ+d
	/6yOQnNWM6EEAc8qc5Yzn4n8pNoMT4XcuOZrPDpX1ua7PZUDvyQkjOFitLP9zaCfaEuLpXksKL0
	stkM2C8hhIrWhc6s2Ejd+n67PJelgq7edqVG3gynaxBbd+PScVW2T94LhaahNef2k5bjl8Dhvwb
	ueeaDbwaOkZ+0DXxst9DfXUBI/Jnzb8jqqM8+gf2MvCD3g7biikpeng2wB7bVCGlPioky8H1HXL
	+VS8+ri0lUJPVFpAkUFklatGl2GddKDOUcIloISy3kJ5/KU9nzl4VBin70XuhnuLZoygaQRDFVJ
	VbJpnA49O1v1dThOLnvHX7fISnOcPPfZJKiOI4SDRSnlZ9YUpAO+UNgsTLeLvkjE5v
X-Received: by 2002:a05:6a20:6a05:b0:3c4:3112:3b with SMTP id adf61e73a8af0-3cb85e771acmr1942200637.18.1785880746119;
        Tue, 04 Aug 2026 14:59:06 -0700 (PDT)
Received: from 92650adf53de ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b0bfesm8590429eec.3.2026.08.04.14.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 14:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] soc/for-next: (build) use of undeclared identifier
 'QCOM_ID_SDM850' in drivers/soc/qcom/...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: soc@lists.linux.dev
Reply-To: kernelci@lists.linux.dev
Date: Tue, 04 Aug 2026 21:59:05 -0000
Message-ID: <178588074443.6433.18101951458881957743@kernelci.org>

New build issue found on soc/for-next:

---
 use of undeclared identifier 'QCOM_ID_SDM850' in drivers/soc/qcom/socinfo.o (drivers/soc/qcom/socinfo.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/drivers/soc/qcom/socinfo.c:428:4: error: use of undeclared identifier 'QCOM_ID_SDM850'
  428 |         { qcom_board_id(SDM850) },
      |           ^~~~~~~~~~~~~~~~~~~~~
/tmp/kci/linux/drivers/soc/qcom/socinfo.c:25:27: note: expanded from macro 'qcom_board_id'
   25 | #define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
      |                           ^~~~~~~~~~~~~~
<scratch space>:154:1: note: expanded from here
  154 | QCOM_ID_SDM850
      | ^~~~~~~~~~~~~~
/tmp/kci/linux/drivers/soc/qcom/socinfo.c:566:22: error: invalid application of 'sizeof' to an incomplete type 'const struct soc_id[]'
  566 |         for (idx = 0; idx < ARRAY_SIZE(soc_id); idx++) {
      |                             ^~~~~~~~~~~~~~~~~~
/tmp/kci/linux/include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
   11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
      |                                ^~~~~
2 errors generated.

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:e68e98fe54e609d3bb87f71e48896fb8322e8cb0
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
- commit HEAD:  81aa917982c10b9f2cd0dd767d7af5af6057d93d

# Builds where the incident occurred:

## multi_v7_defconfig on (arm):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a724edc54179f15da9e5450

#kernelci issue maestro:e68e98fe54e609d3bb87f71e48896fb8322e8cb0

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
