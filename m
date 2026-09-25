Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC543453A50
	for <soc@lists.linux.dev>; Fri, 25 Sep 2026 07:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322219; cv=none; b=PKuClGPcxL+VGetda77cq4hXRAwRT41iZOlLJfpB3r+drvAEF9QBuoL84dZ1qPPP71KQxwfEBcJgWMzutYmkvtffe8e/EErPJJbPr+vp0lVXyVAf/b/cZuva4p5A3sYdAquklhWw6JrzhltxFBZJieycFVsXIED598a93iWb2S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322219; c=relaxed/simple;
	bh=AD6u7FdoeUADwTnTJ/GsHGXbI7Jju8HXgSAGAH8Uy3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KASIoC+HLiLJHF6lWzwMFdI3wM5yNjhl8ppdgLEHcUxUe6sTfI18cFySRKZ4AEMMICiczMisAZKsmWN0DibEff/NzmwWlZQw87E//tMgnWnkscQLh3n66FlS6jJQyrY5vzlzE56KjhMrKhNnwyBTvAPvMOBXQZVVAjffuCoEekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIiqcfKq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fmle4IXS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIiqcfKq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fmle4IXS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YVPd3736793
	for <soc@lists.linux.dev>; Fri, 25 Sep 2026 07:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M/DWbxeGSIRIL3H4zTAb/a
	2zRJf/Vq+YD16QWknpe5Y=; b=LIiqcfKqXKmfhIK1/ZC+Gtaf3+7ej0KjyJj9ov
	/ZywfjJGlyXdR4PnLawwfhEduuhiu2GlWaGWZ3GAXVyhmCxp7Zan0CH4hLrCkAZi
	EmJxswJW8CFnllbKvCUDTen3RWWjPkyNOUVmgybxJ8q8aTXntqza96hAVq9v5gdd
	HNZT4/6/h+nbxkQt4DtSUGNUYFfFlXcfT2Zw9k252Od6Ksp6VVWm5tpPG8ENbdej
	5U6RDc8IKzBwqwuAnSq2dlciZhMBlUBpE1Vo3P8ZkNfN5/gT1t+Hnj4qLROGPXCv
	gT7a4pgX2tgHnmUxk0Ld1AbLzHJ8jWsoBQW+lFNuKumA/qwg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e373d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Fri, 25 Sep 2026 07:43:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1de6d5c3so146418385a.3
        for <soc@lists.linux.dev>; Fri, 25 Sep 2026 00:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790322216; x=1790927016; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M/DWbxeGSIRIL3H4zTAb/a2zRJf/Vq+YD16QWknpe5Y=;
        b=Fmle4IXSBdQ3pb9FQQumBkqs+kO/MmLCdeX8W5NcUHO3r2awIzKEMVBcKjfjUTl6wz
         ZjDDhVXrTXbPy8zxGB5rKEEe46x/jdt2ufVF91SI5favx41NhvDTm4bKNi5kcU8XGZAc
         g3WiT+pXjt23bZ7IhSr0lw5Jq6AAarvvObWdLwgyzoM7Nsvp+oZi9/+ejN3sZFv/fqpo
         Glh714xWJz9GCoLEm+tdFoKlUfHJmxJQqKGjXunaYqfeSdfRPuYtaRI2C5sym6aGeBQr
         Nq+VzkgbzLGe1TTyHGi7yrGRGb4r1TOnB65/tbw4K5BGkak5g2HrU3749yb5+2Oz/89r
         AvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790322216; x=1790927016;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M/DWbxeGSIRIL3H4zTAb/a2zRJf/Vq+YD16QWknpe5Y=;
        b=oAeC68YRAmCK5T/vd+tRVHyhJUDj4jCSXzPVgLAz1FPuSLRrfIjHtDsvz6s6K+szVo
         +sXI+o7glWYZV9CPMtBD8RthO4xTCIaglONAVUfPsjHekJrinRJS9vgE9QKwa0Gna5Yx
         xeDGy+WXxMCfTXpdnc4hyzLgGEBukMamvg+yQcnwyuOZXfnJjVptVbcGBIzyN8t/KPAK
         5hzGVtERY9kS8lTseEbF9bHYblsiF4sTMPk0fR6I7XTinqsTDhQtbtEob1fqfIdF1GLe
         9Pw7u24T5A2KFpA1fkS0FCuDeD8/wfW/CLOFW0uqBKOrk4LA+CSsJDniBmM/ZHyY4N9R
         LeOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoIhh5pJ/ssu5tvWBa/mOTLLpg2UEg+z4h8u53cIy9Y/dCQvWVcm+UrIbTg+BKqAU0rl8=@lists.linux.dev
X-Gm-Message-State: AFuF++l3kBg0QgTO8V+byjMczp+1Pa7tdsEP9y+/024nYMiGSASJqGpY
	F269W1s+4yF5WMjnjZfHkECQ0Ak35UBuZ6IS3Drd+6285PN6W5Oz9ICMXFyTsbpIPIZ08HVziDt
	I26msvPtJYAylEcC6JuIwdHVxUV1btBSHFLUt6aSm1CjXHTG000fzTFI=
X-Gm-Gg: AYBFou0+qNoI+lPtmRHxLbU0jjNn+aiSc9z39Isw4H6eHyWar8s8xqkbIu/yQmmLGEs
	ev8gPMYb1vgeiQaFEa4TSeElAnPty3m6Rzk7ZBgqVBkeNv/ZBnS0slZ2TQCfE/N4VVYmM0zQhAH
	IMg/cO0BTl1tH3+PwrYlLjkuZCpUjoplAD/T9mJgnZb36yAwsOE56M3rCb4dysmnOE+/VJ45Ng1
	gUh5l/A/0qZB3CCnowHLIduz9yUy+aCxV7UrQ3PU+1hU/gWWj3GUv69V1KmakLPS0SsxxkANXcK
	sSJweX/PxoXQyrZC2o4IBKkJuyZlEBPBDPYs6PrSqZT338KpH+jthzwX5rg+vA7S5SEyuXhIIN7
	jGgYiU2NPzNgodPjmE7SvOoLYmeUI
X-Received: by 2002:a05:620a:2b94:b0:93b:c3ce:9056 with SMTP id af79cd13be357-93c43cc71afmr302935285a.1.1790322215776;
        Fri, 25 Sep 2026 00:43:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2b94:b0:93b:c3ce:9056 with SMTP id af79cd13be357-93c43cc71afmr302932885a.1.1790322215287;
        Fri, 25 Sep 2026 00:43:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bde1:52f9:d7f0:c581])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee911e9bsm53820945e9.1.2026.09.25.00.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 00:43:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:43:17 +0200
Subject: [PATCH RESEND] arm64: enable HAVE_SHARED_GPIOS for all ARM64
 platforms
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-arm64-have-shared-gpios-v1-1-57fed3fae35c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABUmtmoC/4WNwQ6CMBBEf4Xs2SUtIARPHuTqQY+GQ20XaCIUu
 9poCP9uww94meTNZGYWYPKWGA7JAp6CZeumCHKXgB7U1BNaExkykZWiFhUqP5YFDioQ8qA8Gex
 n6xgLXWpRmcroPUFsz546+9mWb3Bprs35BG30B8sv57/bYZBb+nc7SJSYS9XVRabuueiOjjl9v
 tVDu3FMo0C7rusP/MHD0c0AAAA=
X-Change-ID: 20260907-arm64-have-shared-gpios-4c6c07d7dc5e
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Drew Fustini <fustini@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Frank Li <Frank.Li@nxp.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2513;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=AD6u7FdoeUADwTnTJ/GsHGXbI7Jju8HXgSAGAH8Uy3Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqtiYgnMpt+ze/3gOBof/K5QUMTpTjKTsj89xpR
 aYhi4BObeyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarYmIAAKCRAFnS7L/zaE
 w0SrD/4vfSDU0oVoElzWp+gQZ29LGTH8q+y1RBxSnlUiiIpKfUXPbSaGgB+OtaszwgI8R+/H9ib
 iDLtS6bnV5R5oHaqG/zkpMt8n9Ghb5CdU4kriuimfC6KxSAp+GL2zmRQkKm/w3Tjq6rYahaRFn6
 PZ1WWNZVe56L8nlVfDjpAAj+r4UQxuOKyrCFjAxoBpV2wsf63ryBOVHZgUOMkCE4axrjBnBLKmp
 ert7OYK6xC0bB5rDYIhEmBTAj3dutD6SsHHbWVLKveMUUIvLbwm7UJBN2Mv2SUB5tmFrdvhcGmo
 dInoZuK5ZqTWUk8gN86l9XeQeR9fXk9QBiZRhhHz318rz/saJMOsqbwNhBkWJgKOe6lZt9YlJZQ
 MgaOS0lMSXaZwyGfPpPisDvspKulNpl8dIAe1tO/ctpD4P2c8cnkOOstPcthxhFu1h53CfWuGNU
 4cHO7+xICvfFb4ceqaA6Y2fqMvO0Cb8e+0PYQwY8iTl8sfFwdQn3q5/o3Me5IZJC2aJQ7TnUfKQ
 8h5OyCQQjAs5Wsaqi0wG83KVVCar3GL/o7NzlRVp5skiDE9kdpO/bQsmifQaGLq3mx4a6G3s5zv
 Y9mxgrHgu4ny7Rnku2vYmEOqHAqqE61E3nUKFzbF6Bhk+HC30bPHh6KPSJ9ez+3uxlvMGcgtc0M
 rLchbTXc9wQBXcQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMCBTYWx0ZWRfXwAFUUvMsXwr+
 jwkFz7+dEpdI2fmb30iaZzJmLB5yb6HQT1kDS3zYT307uEj7LwVDdK8XJta3mwn2aqP3D2d0V13
 9ELC+mY4c7tqNKbcimB4e2Gvn2kRCsvS2i7+kjoS1Gh8asWYJzDlsfm5hzUkQw+hBpm1oPlAt9W
 +9NVxxDBZGGXMasoPuh12z/e3yqkqHUZnkO1lxFm+/xnpKMhk2Ue22l4hQrgQrEdbZaLRUajXEN
 aediXXsBCR1M9kjcQk+rKAN7X9bmLfZm4gAjzjSGsjOt7ORtCKYOy8wp8HMzh5Zp3xWsODdx9PN
 /Ynv1xQK9k4FHwoW9WldK5h1K088Uerb8V+YJJpzQ/fV1ig6Ggs2xXwVQin6R3jfCNj/D/DwJos
 nND/3bWyOubxBWP+r5eEPtT4pnHPySfp3s7/Uv/eLn6Zyw3SMnwKjJ6XAvy/Et15xW9RWGyLjQa
 FB9faYs2tpwYqNzhfKA==
X-Proofpoint-GUID: iboO2VwDxv0xLSv0hyd8YBrOHWXdBQxV
X-Proofpoint-ORIG-GUID: iboO2VwDxv0xLSv0hyd8YBrOHWXdBQxV
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab62628 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=xAMoY1eAQyGtPIDUt64A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMCBTYWx0ZWRfX7Ep4S39BlSqq
 nNARRMfnRq0zhdX4K8uX2ncs9siIyaOa+b3LjcaFL1Zc45UEtGuRK3soFH4/AX/C71bpqwY/70/
 6lojwPG7RqpC8Sgjp+pOLi8A1/YPR6k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250030

Shared GPIO management provided by the GPIO shared proxy module has been
enabled for Qualcomm platforms for some time. By extension of the
defconfig, it's been effectively enabled for all ARM64 platforms when
using the default configuration. Bugs discovered initially after the
feature was first enabled, were fixed and I haven't seen any new reports
for several months. Make the feature enabled by default for all ARM64
platforms officially, which will allow us to continue the removal of the
deprecated GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from the kernel.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Hi ARM SoC maintainers! As per Catalin's message[1], I'm resending it to
wider audience. Can you please queue it for v7.4 via the ARM SoC tree?

[1] https://lore.kernel.org/all/arPfRFC5jzVaSQvq@arm.com/
---
 arch/arm64/Kconfig           | 1 +
 arch/arm64/Kconfig.platforms | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 94cc8075460f0a763cd82b2cabbdb80275042935..19e453b1214353e842e0aa9d3ff9f684c5b693e5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -195,6 +195,7 @@ config ARM64
 		if DYNAMIC_FTRACE_WITH_ARGS
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
+	select HAVE_SHARED_GPIOS
 	select HAVE_BUILDTIME_MCOUNT_SORT
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select HAVE_GUP_FAST
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 1489bad527d8e61584b2a29e5161820cbc0ec0f7..21fb82ab4983f80fc3eaba7cdb5627cf80a18c95 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -37,7 +37,6 @@ config ARCH_APPLE
 	bool "Apple Silicon SoC family"
 	select APPLE_AIC
 	select APPLE_PMGR_PWRSTATE if PM
-	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for Apple's in-house ARM SoC family, such
 	  as the Apple M1.
@@ -329,7 +328,6 @@ config ARCH_QCOM
 	select GPIOLIB
 	select PINCTRL
 	select HAVE_PWRCTRL if PCI
-	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for the ARMv8 based Qualcomm chipsets.
 

---
base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
change-id: 20260907-arm64-have-shared-gpios-4c6c07d7dc5e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

